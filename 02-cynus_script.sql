
CREATE TABLE IF NOT EXISTS cygni.paises(
    idestado integer NOT NULL,
    nome varchar(80) NOT NULL,
    uf varchar(2) NOT NULL,
    ibge integer NOT NULL,
    idpais integer NOT NULL,
    ddd varchar(50) NOT NULL,
    CONSTRAINT pk_estados PRIMARY KEY (idestado)
);

CREATE TABLE IF NOT EXISTS cygni.estados(
    idestado integer NOT NULL,
    uf varchar(2) NOT NULL,
    ibge integer NOT NULL,
    idpais integer NOT NULL,
    ddd varchar(50) NOT NULL,
    CONSTRAINT PK_estados PRIMARY KEY (idestado),
	CONSTRAINT FK_idpais_est FOREIGN KEY (idpais) REFERENCES cygni.paises(idpais)
);

CREATE TABLE IF NOT EXISTS cygni.municipios(
    idmunicipio integer NOT NULL,
    codemun integer NOT NULL,
    nome varchar(255) NOT NULL,
    uf char(2) NOT NULL,
    capital boolean DEFAULT false,
    CONSTRAINT PK_municipios PRIMARY KEY (idmunicipio)
);

CREATE TABLE IF NOT EXISTS cygni.categorias(
	idcategoria integer not null,
	nome varchar(255) not null,
	status smallint not null,
	CONSTRAINT PK_categorias PRIMARY KEY(idcategoria)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_categorias;
	
CREATE TABLE IF NOT EXISTS cygni.estadocivis(
	idestadocivil smallint not null,
	nome varchar(30) not null,
	CONSTRAINT PK_estadocivis PRIMARY KEY(idestadocivil)
);
	
CREATE TABLE IF NOT EXISTS cygni.clientes(
	idcliente integer not null,
	tipopessoa smallint not null,
	idcategoria integer not null,
	foto Bytea not null,
	nome varchar(255) not null,
	dtnascimento date not null,
	genero smallint not null,
	cpf_cnpj varchar(14) not null,
	rg_inscricaoestadual varchar(11),
	orgooexpedidor varchar(6),
	dtemissoo date,
	estadocivil smallint,
	celular varchar(11) not null,
	telefone varchar(11) not null,
	ramal varchar(3),
	fax varchar(11), 
	email varchar(255) not null,
	observacao text,
	status smallint not null,
	CONSTRAINT PK_clientes PRIMARY KEY(idcliente),
	CONSTRAINT FK_ESTCIV_CLI FOREIGN KEY(estadocivil) 
		REFERENCES cygni.estadocivis(idestadocivil),
	CONSTRAINT CHK_GEN_CLI CHECK (genero < 0 OR genero > 1)
);
 	
CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_clientes;

CREATE TABLE IF NOT EXISTS cygni.clienteenderecos(
	idcliente integer not null,
	endereco varchar(255) not null,
	numero varchar(20) not null,
	cep varchar(8) not null, 
	bairro varchar(50) not null,
	idestado integer not null,
	idmunicipio integer not null,
	idpais integer not null,
	complemento varchar(255),
	referencia varchar(255),
	CONSTRAINT PK_clienteenderecos PRIMARY KEY(idcliente),
	CONSTRAINT FK_EST_CLI_END FOREIGN KEY(idestado) REFERENCES cygni.estados(idestado),
	CONSTRAINT FK_MUN_CLI_END FOREIGN KEY(idmunicipio) REFERENCES cygni.municipios(idmunicipio),
	CONSTRAINT FK_PAI_CLI_END FOREIGN KEY(idpais) REFERENCES cygni.paises(idpais)
);

CREATE TABLE IF NOT EXISTS cygni.fornecedores(
	idfornecedor integer not null,
	tipopessoa smallint not null,
	nome varchar(255) not null,
	idcategoria integer not null,
	dtnascimento date not null,
	genero smallint,
	cpf_cnpj varchar(14) not null,
	rg_inscricaoestadual varchar(11),
	orgooexpedidor varchar(6),
	dtemissao date,
	foto oid not null,
	estadocivil smallint,
	celular varchar(11) not null,
	telefone varchar(11) not null,
	ramal varchar(3),
	fax varchar(11), 
	email varchar(255) not null,
	observacao text,
	status smallint not null,
	CONSTRAINT PK_fornecedores PRIMARY KEY(idfornecedor),
	CONSTRAINT CHK_GEN_FORN CHECK (genero < 0 OR genero > 1)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_fornecedores;

CREATE TABLE IF NOT EXISTS cygni.fornecedorenderecos(
	idfornecedor integer not null,
	endereco varchar(255) not null,
	numero varchar(20) not null,
	cep varchar(8) not null, 
	bairro varchar(50) not null,
	idestado integer not null,
	idmunicipio integer not null,
	idpais integer not null,
	complemento varchar(255),
	referencia varchar(255),
	CONSTRAINT PK_fornecedorenderecos PRIMARY KEY(idfornecedor),
	CONSTRAINT FK_EST_FORN_END FOREIGN KEY(idestado) REFERENCES cygni.estados(idestado),
	CONSTRAINT FK_MUN_FORN_END FOREIGN KEY(idmunicipio) REFERENCES cygni.municipios(idmunicipio),
	CONSTRAINT FK_PAI_FORN_END FOREIGN KEY(idpais) REFERENCES cygni.paises(idpais)
);

CREATE TABLE IF NOT EXISTS cygni.cargos(
	idcargo integer not null,
	nome varchar(255)not null,
	CONSTRAINT PK_cargos PRIMARY KEY(idcargo)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_cargos;

CREATE TABLE IF NOT EXISTS cygni.funcionarios(
	idfuncionario integer not null,
	nome varchar(255) not null,
	dtnascimento date not null,
	genero smallint not null,
	idcargo integer not null,
	dtcontratacao date not null,
	cpf varchar(14) not null,
	rg varchar(11) not null,
	orgooexpedidor varchar(6),
	dtemissao date,
	foto oid not null,
	estadocivil smallint,
	celular varchar(11) not null,
	telefone varchar(11) not null,
	ramal varchar(3),
	email varchar(255) not null,
	observacao text,
	status smallint not null,
	CONSTRAINT PK_funcionarios PRIMARY KEY(idfuncionario),
	CONSTRAINT PK_cargos FOREIGN KEY(idcargo) REFERENCES cygni.cargos(idcargo),
	CONSTRAINT CHK_GEN_FUNC CHECK (genero < 0 OR genero > 1)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_funcionarios;

CREATE TABLE IF NOT EXISTS cygni.funcionarioenderecos(
	idfuncionario integer not null,
	endereco varchar(255) not null,
	numero varchar(20) not null,
	cep varchar(8) not null, 
	bairro varchar(50) not null,
	idestado integer not null,
	idmunicipio integer not null,
	idpais integer not null,
	complemento varchar(255),
	referencia varchar(255),
	CONSTRAINT PK_funcionarionderecos PRIMARY KEY(idfuncionario),
	CONSTRAINT FK_EST_FUNC_END FOREIGN KEY(idestado) REFERENCES cygni.estados(idestado),
	CONSTRAINT FK_MUN_FUNC_END FOREIGN KEY(idmunicipio) REFERENCES cygni.municipios(idmunicipio),
	CONSTRAINT FK_PAI_FUNC_END FOREIGN KEY(idpais) REFERENCES cygni.paises(idpais)
);

CREATE TABLE IF NOT EXISTS cygni.transportadores(
	idtransportador integer not null,
	tipopessoa smallint not null,
	idcategoria integer not null,
	nome varchar(255) not null,
	dtnascimento date not null,
	genero smallint not null,
	cpf_cnpj varchar(14) not null,
	rg_inscricaoestadual varchar(11),
	orgooexpedidor varchar(6),
	dtemissao date,
	foto oid not null,
	estadocivil smallint,
	celular varchar(11) not null,
	telefone varchar(11) not null,
	ramal varchar(3),
	fax varchar(11), 
	email varchar(255) not null,
	observacao text,
	status smallint not null,
	CONSTRAINT PK_transportadores PRIMARY KEY(idtransportador),
	CONSTRAINT CHK_GEN_TRAN CHECK (genero < 0 OR genero > 1)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_transportadores;

CREATE TABLE IF NOT EXISTS cygni.transportadorenderecos(
	idtransportador integer not null,
	endereco varchar(255) not null,
	numero varchar(20) not null,
	cep varchar(8) not null, 
	bairro varchar(50) not null,
	idestado integer not null,
	idmunicipio integer not null,
	idpais integer not null,
	complemento varchar(255),
	referencia varchar(255),
	CONSTRAINT PK_transportadorenderecos PRIMARY KEY(idtransportador),
	CONSTRAINT FK_EST_TRAN_END FOREIGN KEY(idestado) REFERENCES cygni.estados(idestado),
	CONSTRAINT FK_MUN_TRAN_END FOREIGN KEY(idmunicipio) REFERENCES cygni.municipios(idmunicipio),
	CONSTRAINT FK_PAI_TRAN_END FOREIGN KEY(idpais) REFERENCES cygni.paises(idpais)
);

CREATE TABLE IF NOT EXISTS cygni.marcas(
	idmarca integer not null,
	sigla varchar(5)not null,
	nome varchar(255)not null,
	CONSTRAINT PK_marcas PRIMARY KEY(idmarca)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_marcas;

CREATE TABLE IF NOT EXISTS cygni.unidades(
	idunidade integer not null,
	nome varchar(255)not null,
	CONSTRAINT PK_unidades PRIMARY KEY(idunidade)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_unidades;

CREATE TABLE IF NOT EXISTS cygni.produtocategorias(
	idprodutocategoria integer not null,
	nome varchar(255)not null,
	CONSTRAINT PK_produtocategorias PRIMARY KEY(idprodutocategoria)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_produtocategorias;

CREATE TABLE IF NOT EXISTS cygni.produtoorigem(
	idorigem integer not null,
	nome varchar(255)not null,
	CONSTRAINT PK_produtoorigem PRIMARY KEY(idorigem)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_produtoorigem;

Create Table IF NOT EXISTS cygni.NCM(
  IdNCM Integer NOT NULL,
  NCMCode VARCHAR(20) NOT NULL,
  NCM VARCHAR(8) NOT NULL,
  Nome VARCHAR(128) NOT NULL,
  status smallint NOT NULL default 0,
  Constraint PK_NCM primary key(IdNCM)
);

CREATE SEQUENCE IF NOT EXISTS cygni.Seq_NCM;

CREATE TABLE IF NOT EXISTS cygni.produtos(
	idproduto integer not null,
	nome varchar(255) not null,
	idmarca integer not null,
	idprodutocategoria integer not null,
	idunidade integer not null,
	ean varchar(13) not null,
	ncm varchar(8) not null,
	idorigem integer not null,
	precocompra numeric(15,2) not null,
	precovenda numeric(15,2) not null,
	customedio numeric(15,2) not null,
	saldo numeric(15,2) not null,
	estoqueminimo numeric(15,2) not null,
	estoquemaximo numeric(15,2) not null,
	pesobruto numeric(15,2) not null,
	pesoliquido numeric(15,2) not null,
	observacao text,
	status smallint DEFAULT 0 not null,
	CONSTRAINT PK_produtos PRIMARY KEY(idproduto),
	CONSTRAINT FK_MAR_PRO FOREIGN KEY(idmarca) REFERENCES cygni.marcas(idmarca),
	CONSTRAINT FK_CAT_PRO FOREIGN KEY(idprodutocategoria) REFERENCES cygni.produtocategorias(idprodutocategoria),
	CONSTRAINT FK_UND_PRO FOREIGN KEY(idunidade) REFERENCES cygni.unidades(idunidade),
	CONSTRAINT FK_ORI_PRO FOREIGN KEY(idorigem) REFERENCES cygni.produtoorigem(idorigem)
);   

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_produtos;

CREATE TABLE IF NOT EXISTS cygni.produtotributos(
	idproduto integer not null,
	aliquotaICMS numeric(15,2) not null,
	aliquotaIPI numeric(15,2) not null,
	aliquotaPIS numeric(15,2) not null,
	aliquotaCOFINS numeric(15,2) not null,
	codigobeneficilfiscal varchar(20),
	cest integer not null,
	percfederal numeric(15,2),
	precestatudal numeric(15,2),
	CONSTRAINT PK_produtotributos PRIMARY KEY(idproduto)
);

CREATE TABLE IF NOT EXISTS cygni.produtomarkup(
	idproduto integer not null,
	precocompra numeric(15,2) not null,
	preccreditoicms numeric(15,2) not null,
	valorcreditoicms numeric(15,2) not null,
	frete numeric(15,2),
	precipi numeric(15,2),
	valoripi numeric(15,2),
	preccreditoicmsst numeric(15,2),
	valorcreditoicmsst numeric(15,2),
	custoadiconal numeric(15,2),
	percmargemlucro numeric(15,2) not null,
	valormargemlucro numeric(15,2) not null,
	precovenda numeric(15,2) not null,
	CONSTRAINT PK_produtomarkup PRIMARY KEY(idproduto)
);

CREATE TABLE IF NOT EXISTS cygni.produtofornecedores(
    idproduto integer NOT NULL,
    idfornecedor integer NOT NULL,
    precocompra numeric(15,2) NOT NULL,
    CONSTRAINT pk_produtofornecedores PRIMARY KEY (idproduto, idfornecedor),
    CONSTRAINT FK_PRO_FOR_PROFOR FOREIGN KEY (idfornecedor)
        REFERENCES cygni.fornecedores (idfornecedor),
    CONSTRAINT fk_idproduto_profor FOREIGN KEY (idproduto)
        REFERENCES cygni.produtos (idproduto)
);

CREATE TABLE IF NOT EXISTS cygni.empresas(
    IdEmpresa Integer not null,
    RazaoSocial Varchar(255) not null,
    NomeFantasia Varchar(255) not null,
    CNPJ Varchar(18) not null,
    InscricaoEstadual Varchar(12), 
    InscricaoMunicipal Varchar(14), 
    CNAE Varchar(10) not null,
    CRT SmallInt not null,
  	celular varchar(11) not null,
	telefone varchar(11) not null,
	ramal varchar(3),
	fax varchar(11), 
	email varchar(255) not null,
    CONSTRAINT PK_empresas primary key(idempresa)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_empresas;

CREATE TABLE IF NOT EXISTS cygni.empresaenderecos(
	idempresa integer not null,
	endereco varchar(255) not null,
	numero varchar(20) not null,
	cep varchar(8) not null, 
	bairro varchar(50) not null,
	idestado integer not null,
	idmunicipio integer not null,
	idpais integer not null,
	complemento varchar(255),
	referencia varchar(255),
	CONSTRAINT PK_empresaenderecos PRIMARY KEY(idempresa),
	CONSTRAINT FK_EST_EMP_END FOREIGN KEY(idestado) REFERENCES cygni.estados(idestado),
	CONSTRAINT FK_MUN_EMP_END FOREIGN KEY(idmunicipio) REFERENCES cygni.municipios(idmunicipio),
	CONSTRAINT FK_PAI_EMP_END FOREIGN KEY(idpais) REFERENCES cygni.paises(idpais)
);

CREATE TABLE IF NOT EXISTS cygni.Formapagamentos( 
    IdFormapagamento Integer not null,
    nome Varchar(80) not null,
    Constraint PK_Formapagamentos primary key(IdFormapagamento)
);

Create Sequence IF NOT EXISTS cygni.Seq_Formapagamentos;

CREATE TABLE IF NOT EXISTS cygni.FormapagamentoItens(
    IdFormapagamento Integer not null,
    Item Integer not null,
    Parcelas Integer not null,
    Dias Integer not null,
    Fator Numeric(15,2) not null,
    Constraint PK_FormapagamentoItens primary key(IdFormapagamento, Item)
);

Create Sequence IF NOT EXISTS cygni.Seq_FormapagamentoItens;

create or replace procedure cygni.sp_addformapagamento(nome Varchar(80), Parcelas Integer)
language plpgsql
as $$
declare
-- variable declaration
  IdFormapagto Integer;
  Dias Integer;
  Percentual Numeric(15,2);
  Acumulado Numeric(15,2);
  Cont Integer;
begin
-- stored procedure body

	IdFormapagto := Nextval('cygni.Seq_Formapagamentos');
	Dias:= 30;
	Cont:= 1;
	Percentual:= trunc( (1.0 / Parcelas) , 2);
	Acumulado:= 0;
	
	INSERT INTO cygni.Formapagamentos(IdFormapagamento, Nome) VALUES (IdFormapagto, nome);
	
	WHILE Cont <= Parcelas LOOP
        
		INSERT INTO cygni.FormapagamentoItens(IdFormapagamento, Item, Parcelas, Dias, Fator) 
		VALUES(IdFormapagto, Nextval('cygni.Seq_FormapagamentoItens'), Cont, Dias, Percentual);
		
		Acumulado:= Acumulado + Percentual;
		
		IF (Cont + 1 = Parcelas) THEN
		   IF (Acumulado + Percentual < 1) THEN
		      Percentual:= trunc( (1.0-Acumulado), 2);
		   END IF;		
		END IF;
			
		Dias:= Dias + 30;
		Cont:= Cont + 1;
    END LOOP;

end; $$

CREATE TABLE IF NOT EXISTS cygni.orcamentos(
	idempresa integer not null,
	idorcamento integer not null,
	dtemisao timestamp with time zone,
	idcliente integer not null,
	idfuncionario integer not null,
	idtransportador integer not null,
	idformapagamento integer not null,
	modalidadefrete integer not null,
	prazoentrega integer not null,
	pesebruto numeric(15,2) DEFAULT 0,
	peseliquido numeric(15,2) DEFAULT 0,
	validade date not null,
	observacoes text,
	subtotal numeric(15,2) DEFAULT 0,
	valoripi numeric(15,2) DEFAULT 0,
	percicms numeric(15,2)  DEFAULT 0,
	desconto numeric(15,2) DEFAULT 0,
	total numeric(15,2) DEFAULT 0,
	status smallint default 0, 
	CONSTRAINT PK_orcamentos PRIMARY KEY(idempresa, idorcamento),
	CONSTRAINT FK_EMP_ORC FOREIGN KEY(idempresa) REFERENCES cygni.empresas(idempresa),
	CONSTRAINT FK_CLI_ORC FOREIGN KEY(idcliente) REFERENCES cygni.clientes(idcliente),
	CONSTRAINT FK_FUN_ORC FOREIGN KEY(idfuncionario) REFERENCES cygni.funcionarios(idfuncionario),
	CONSTRAINT FK_TRAN_ORC FOREIGN KEY(idtransportador) REFERENCES cygni.transportadores(idtransportador),
	CONSTRAINT FK_FORM_ORC FOREIGN KEY(idformapagamento) REFERENCES cygni.formapagamentos(idformapagamento)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_orcamentos;

CREATE TABLE IF NOT EXISTS cygni.orcamentoitens(
	idempresa integer not null,
	idorcamento integer not null,
	item integer not null,
	idproduto integer not null,
	quantidade numeric(15,2) not null,
	valorunitario numeric(15,2) not null,
	subtotal numeric(15,2) not null,
	valoripi numeric(15,2) DEFAULT 0,
	percicms numeric(15,2)  DEFAULT 0,
	desconto numeric(15,2) not null,
	total numeric(15,2) not null,
	CONSTRAINT PK_orcamentoitens PRIMARY KEY(idempresa, idorcamento, item),
	CONSTRAINT FK_EMP_ORC FOREIGN KEY(idempresa) REFERENCES cygni.empresas(idempresa),
	CONSTRAINT FK_PRO_ORC FOREIGN KEY(idproduto) REFERENCES cygni.produtos(idproduto)
);

CREATE OR REPLACE FUNCTION cygni.getprecovendaproduto(
	pidproduto integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vprecovenda NUMERIC(15,2);
BEGIN
  SELECT precovenda 
    INTO Vprecovenda 
	FROM cygni.produtos 
   WHERE idproduto = pidproduto;
  
  RETURN Vprecovenda;
END; 
$BODY$;

CREATE OR REPLACE FUNCTION cygni.getproxitemorcamentoitens(
	pidempresa integer,
	pidorcamento integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  VProxItem integer;
BEGIN
  SELECT COALESCE(MAX(item), 0) +1 
    INTO VProxItem 
    FROM cygni.orcamentoitens
   WHERE idempresa = pidempresa 
	 AND idorcamento = pidorcamento;
  
  RETURN VProxItem;
END; 
$BODY$;

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_orcamentoitens_aud()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vsubtotal NUMERIC(15,2);
  Vvaloripi NUMERIC(15,2);
  Vpercicms NUMERIC(15,2);
  Vdesconto NUMERIC(15,2);
  Vtotal NUMERIC(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valoripi), 0), COALESCE(SUM(percicms), 0), 
         COALESCE(SUM(desconto), 0), COALESCE(SUM(total), 0)  
    INTO Vsubtotal, Vvaloripi, Vpercicms, Vdesconto, Vtotal
    FROM cygni.orcamentoitens
   WHERE idempresa = OLD.idempresa
	 AND idorcamento = OLD.idorcamento;
	
  UPDATE cygni.orcamentos
     SET subtotal = Vsubtotal,
	     valoripi = Vvaloripi,
		 percicms = Vpercicms,
	     desconto = Vdesconto,
		 total = Vtotal
  WHERE idempresa = OLD.idempresa
	AND idorcamento = OLD.idorcamento;
	
  RETURN OLD;   
END
$BODY$;

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_orcamentoitens()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vsubtotal NUMERIC(15,2);
  Vvaloripi NUMERIC(15,2);
  Vpercicms NUMERIC(15,2);
  Vdesconto NUMERIC(15,2);
  Vtotal NUMERIC(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valoripi), 0), COALESCE(SUM(percicms), 0), 
         COALESCE(SUM(desconto), 0), COALESCE(SUM(total), 0) 
    INTO Vsubtotal, Vvaloripi, Vdesconto, Vtotal
    FROM cygni.orcamentoitens
   WHERE idempresa = NEW.idempresa
	 AND idorcamento = NEW.idorcamento;
	
  UPDATE cygni.orcamentos
     SET subtotal = Vsubtotal,
	     valoripi = Vvaloripi,
		 percicms = Vpercicms,
	     desconto = Vdesconto,
		 total = Vtotal
  WHERE idempresa = NEW.idempresa
	AND idorcamento = NEW.idorcamento;
	
  RETURN NEW;   
END
$BODY$;

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_orcamentoitens_ai
    AFTER INSERT
    ON cygni.orcamentoitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_orcamentoitens();

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_orcamentoitens_au
    AFTER UPDATE
    ON cygni.orcamentoitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_orcamentoitens();

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_orcamentoitens_ad
    AFTER DELETE
    ON cygni.orcamentoitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_orcamentoitens();

CREATE TABLE IF NOT EXISTS cygni.pedidovendas(
	idempresa integer not null,
	idpedidovenda integer not null,
	idorcamento integer not null,
	dtemisao timestamp with time zone,
	idcliente integer not null,
	idfuncionario integer not null,
	idtransportador integer not null,
	modalidadefrete integer not null,
	prazoentrega integer not null,
	pesebruto numeric(15,2) DEFAULT 0,
	peseliquido numeric(15,2) DEFAULT 0,
	validade date not null,
	observacoes text,
	subtotal numeric(15,2) DEFAULT 0,
	valoripi numeric(15,2) DEFAULT 0,
	percicms numeric(15,2)  DEFAULT 0,
	desconto numeric(15,2) DEFAULT 0,
	total numeric(15,2) DEFAULT 0, 
	status smallint default 0,
	CONSTRAINT PK_pedidovendas PRIMARY KEY(idempresa, idpedidovenda),
	CONSTRAINT FK_EMP_PEV FOREIGN KEY(idempresa) REFERENCES cygni.empresas(idempresa),
	CONSTRAINT FK_ORC_PEV FOREIGN KEY(idempresa, idorcamento) REFERENCES cygni.orcamentos(idempresa, idorcamento),
	CONSTRAINT FK_CLI_PEV FOREIGN KEY(idcliente) REFERENCES cygni.clientes(idcliente),
	CONSTRAINT FK_FUN_PEV FOREIGN KEY(idfuncionario) REFERENCES cygni.funcionarios(idfuncionario),
	CONSTRAINT FK_TRAN_PEV FOREIGN KEY(idtransportador) REFERENCES cygni.transportadores(idtransportador)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_pedidovendas;

CREATE TABLE IF NOT EXISTS cygni.pedidovendaitens(
    idempresa integer NOT NULL,
    idpedidovenda integer NOT NULL,
    item integer NOT NULL,
    idproduto integer NOT NULL,
    quantidade numeric(15,2) NOT NULL,
    valorunitario numeric(15,2) NOT NULL,
    subtotal numeric(15,2) NOT NULL,
    valoripi numeric(15,2) DEFAULT 0,
    percicms numeric(15,2) NOT NULL,
    desconto numeric(15,2) NOT NULL,
    total numeric(15,2) NOT NULL,
    CONSTRAINT PK_pedidovendaitens PRIMARY KEY (idempresa, idpedidovenda, item),
    CONSTRAINT FK_EMP_PVI FOREIGN KEY (idempresa)
        REFERENCES cygni.empresas (idempresa),
    CONSTRAINT FK_PRO_PVI FOREIGN KEY (idproduto)
        REFERENCES cygni.produtos (idproduto)
);

CREATE OR REPLACE FUNCTION cygni.getproxitempedidovendaitens(
	pidempresa integer,
	pidpedidovenda integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  VProxItem integer;
BEGIN
  SELECT COALESCE(MAX(item), 0) +1 
    INTO VProxItem 
    FROM pedidovendaitens
   WHERE idempresa = pidempresa 
	 AND idpedidovenda = pidpedidovenda;
  
RETURN VProxItem;
END; 
$BODY$;

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_pedidovendaitens()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vsubtotal NUMERIC(15,2);
  Vvaloripi NUMERIC(15,2);
  Vpercicms NUMERIC(15,2);
  Vdesconto NUMERIC(15,2);
  Vtotal NUMERIC(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valoripi), 0), COALESCE(SUM(percicms), 0), 
         COALESCE(SUM(desconto), 0), COALESCE(SUM(total), 0)  
    INTO Vsubtotal, Vvaloripi, Vpercicms, Vdesconto, Vtotal
    FROM cygni.pedidovendaitens
   WHERE idempresa = NEW.idempresa
	 AND idpedidovenda = NEW.idpedidovenda;
	
  UPDATE cygni.pedidovendas
     SET subtotal = Vsubtotal,
	     valoripi = Vvaloripi,
		 percicms = Vpercicms,
	     desconto = Vdesconto,
		 total = Vtotal
  WHERE idempresa = NEW.idempresa
	AND idpedidovenda = NEW.idpedidovenda;
	
  RETURN NEW;   
END
$BODY$;

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_pedidovendaitens_aud()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vsubtotal NUMERIC(15,2);
  Vvaloripi NUMERIC(15,2);
  Vpercicms NUMERIC(15,2);
  Vdesconto NUMERIC(15,2);
  Vtotal NUMERIC(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valoripi), 0), COALESCE(SUM(percicms), 0), 
         COALESCE(SUM(desconto), 0), COALESCE(SUM(total), 0)  
    INTO Vsubtotal, Vvaloripi, Vpercicms, Vdesconto, Vtotal
    FROM cygni.pedidovendaitens
   WHERE idempresa = OLD.idempresa
	 AND idpedidovenda = OLD.idpedidovenda;
	
  UPDATE cygni.pedidovendas
     SET subtotal = Vsubtotal,
	     valoripi = Vvaloripi,
		 percicms = Vpercicms,
	     desconto = Vdesconto,
		 total = Vtotal
  WHERE idempresa = OLD.idempresa
	AND idpedidovenda = OLD.idpedidovenda;
	
  RETURN OLD;   
END
$BODY$;

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_pedidovendaitens_ai
    AFTER INSERT
    ON cygni.pedidovendaitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_pedidovendaitens();

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_orcamentoitens_au
    AFTER UPDATE
    ON cygni.pedidovendaitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_pedidovendaitens_aud();

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_pedidovendaitens_ad
    AFTER DELETE
    ON cygni.pedidovendaitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_pedidovendaitens_aud();

CREATE OR REPLACE PROCEDURE cygni.sp_emitirpedidovenda(
	IN pidempresa integer,
	IN pidorcamento integer)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vidpedidovenda integer;
  Vidcliente integer;
  Vidfuncionario integer;
  Vidtransportador integer;
  Vmodalidadefrete integer;
  Vprazoentrega integer;
  Vpesebruto numeric(15,2);
  Vpeseliquido numeric(15,2);
  Vvalidade date;
  Vobservacoes text;
  Vreg record;
BEGIN
  SELECT orcamentos.idcliente, orcamentos.idfuncionario, orcamentos.idtransportador, orcamentos.modalidadefrete, 
         orcamentos.prazoentrega, orcamentos.pesebruto, orcamentos.peseliquido, orcamentos.validade, 
		 orcamentos.observacoes
	INTO Vidcliente, Vidfuncionario, Vidtransportador, Vmodalidadefrete, Vprazoentrega, Vpesebruto, Vpeseliquido, 
	     Vvalidade, Vobservacoes
	FROM cygni.orcamentos
   WHERE idempresa = pidempresa
     AND idorcamento = pidorcamento;
  
  Vidpedidovenda :=  nextval('cygni.SEQ_pedidovendas');
  
  INSERT INTO cygni.pedidovendas  
	VALUES (pidempresa, Vidpedidovenda, pidorcamento, CURRENT_TIMESTAMP, Vidcliente, Vidfuncionario, Vidtransportador,
			Vmodalidadefrete, Vprazoentrega, Vpesebruto, Vpeseliquido, Vvalidade, Vobservacoes, 0, 0, 0, 0, 0);	  

  FOR Vreg IN SELECT orcamentoitens.idproduto, orcamentoitens.quantidade, orcamentoitens.valorunitario, 
	                 orcamentoitens.subtotal, orcamentoitens.valoripi, orcamentoitens.percicms, 
					 orcamentoitens.desconto, orcamentoitens.total
	            FROM cygni.orcamentoitens 
		       WHERE idempresa = pidempresa
				 AND idorcamento = pidorcamento
	LOOP
      INSERT INTO cygni.pedidovendaitens 
        VALUES(pidempresa, Vidpedidovenda, cygni.getproxitempedidovendaitens(pidempresa, Vidpedidovenda), Vreg.idproduto, Vreg.quantidade, Vreg.valorunitario, Vreg.subtotal, 
			   Vreg.valoripi, Vreg.percicms, Vreg.desconto, Vreg.total);
	END LOOP;
END; 
$BODY$;

CREATE TABLE IF NOT EXISTS cygni.cotacaoprecos(
    idempresa integer NOT NULL,
    idcotacaopreco integer NOT NULL,
    dataemissao timestamp with time zone NOT NULL,
	idfuncionario integer NOT NULL,
	idtransportador integer NOT NULL,
	idformapagamento integer NOT NULL,
    subtotal numeric(15,2) NOT NULL,
	valorfrete numeric(15,2) default 0,
	seguro numeric(15,2) default 0,
	outrasdespesas numeric(15,2) default 0,
	desconto numeric(15,2) default 0,
	percipi numeric(15,2) default 0,
	valoripi numeric(15,2) default 0,
	valorii numeric(15,2) default 0,
	baseicms numeric(15,2) default 0,
	percicms numeric(15,2) default 0,
	valoricms numeric(15,2) default 0, 
	baseicmsst numeric(15,2) default 0,
	valoricmsst numeric(15,2) default 0,
    total numeric(15,2) default 0,
	status smallint DEFAULT 0,
    isprocessado boolean DEFAULT false,
	CONSTRAINT PK_cotacaoprecos PRIMARY KEY (idempresa, idcotacaopreco),
	CONSTRAINT FK_EMP_COT_PRE FOREIGN KEY (idempresa)
        REFERENCES cygni.empresas (idempresa),
	CONSTRAINT FK_FUNC_COT_PRE FOREIGN KEY (idfuncionario)
        REFERENCES cygni.funcionarios (idfuncionario),
	CONSTRAINT FK_TRAN_COT_PRE FOREIGN KEY (idtransportador)
        REFERENCES cygni.transportadores (idtransportador),
	CONSTRAINT FK_FORM_COT_PRE FOREIGN KEY (idformapagamento)
        REFERENCES cygni.formapagamentos (idformapagamento)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_cotacaoprecos;

CREATE TABLE IF NOT EXISTS cygni.cotacaoprecoitens(
    idempresa integer NOT NULL,
    idcotacaopreco integer NOT NULL,
    item integer NOT NULL,
    idproduto integer NOT NULL,
	quantidade numeric(15,2) NOT NULL,
    valorunitario numeric(15,2) default 0,
	subtotal numeric(15,2) NOT NULL,
	valorfrete numeric(15,2) default 0,
	seguro numeric(15,2) default 0,
	outrasdespesas numeric(15,2) default 0,
	desconto numeric(15,2) default 0,
	percipi numeric(15,2) default 0,
	valoripi numeric(15,2) default 0,
	valorii numeric(15,2) default 0,
	baseicms numeric(15,2) default 0,
	percicms numeric(15,2) default 0,
	valoricms numeric(15,2) default 0, 
	baseicmsst numeric(15,2) default 0,
	valoricmsst numeric(15,2) default 0,
    total numeric(15,2) default 0,
	status smallint DEFAULT 0,
    CONSTRAINT PK_cotacaoprecoitens PRIMARY KEY (idempresa, idcotacaopreco, item),
    CONSTRAINT FK_EMP_COI FOREIGN KEY (idempresa)
        REFERENCES cygni.empresas (idempresa),
	CONSTRAINT FK_COT_COI FOREIGN KEY (idempresa, idcotacaopreco)
        REFERENCES cygni.cotacaoprecos (idempresa, idcotacaopreco),
    CONSTRAINT FK_PRO_COI FOREIGN KEY (idproduto)
        REFERENCES cygni.produtos (idproduto)
);

CREATE OR REPLACE FUNCTION cygni.getproxitemcotacaoprecoitens(
	pidempresa integer,
	pidcotacaopreco integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  VProxItem integer;
BEGIN
  SELECT COALESCE(MAX(item), 0) +1 
    INTO VProxItem 
    FROM cygni.cotacaoprecoitens
   WHERE idempresa = pidempresa 
	 AND idcotacaopreco = pidcotacaopreco;
  
  RETURN VProxItem;
END; 
$BODY$;

CREATE TABLE IF NOT EXISTS cygni.cotacaoprecoitensfornecedores(
    idempresa integer NOT NULL,
    idcotacaopreco integer NOT NULL,
	idcotacaoprecoitem integer NOT NULL,
    item integer NOT NULL,
    idfornecedor integer NOT NULL,
	idproduto integer NOT NULL,
	quantidade numeric(15,2) NOT NULL,
    valorunitario numeric(15,2) default 0,
	subtotal numeric(15,2) default 0,
	valorfrete numeric(15,2) default 0,
	seguro numeric(15,2) default 0,
	outrasdespesas numeric(15,2) default 0,
	desconto numeric(15,2) default 0,
	percipi numeric(15,2) default 0,
	valoripi numeric(15,2) default 0,
	valorii numeric(15,2) default 0,
	baseicms numeric(15,2) default 0,
	percicms numeric(15,2) default 0,
	valoricms numeric(15,2) default 0, 
	baseicmsst numeric(15,2) default 0,
	valoricmsst numeric(15,2) default 0,
    total numeric(15,2) default 0,
	status smallint DEFAULT 0,
	ismelhorpreco boolean DEFAULT false, 
    CONSTRAINT PK_cotacaoprecoitensfornecedores PRIMARY KEY (idempresa, idcotacaopreco, item),
    CONSTRAINT FK_COIF_COI FOREIGN KEY (idempresa, idcotacaopreco, idcotacaoprecoitem)
        REFERENCES cygni.cotacaoprecoitens (idempresa, idcotacaopreco, item),
    CONSTRAINT FK_EMP_COIF FOREIGN KEY (idempresa)
        REFERENCES cygni.empresas (idempresa),
    CONSTRAINT FK_FORN_COIF FOREIGN KEY (idfornecedor)
        REFERENCES cygni.fornecedores (idfornecedor),
	CONSTRAINT FK_PRO_COIF FOREIGN KEY (idproduto)
        REFERENCES cygni.produtos (idproduto)
);

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_cotacaoprecoitens()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vsubtotal numeric(15,2);
  Vvalorfrete numeric(15,2);
  Vseguro numeric(15,2);
  Voutrasdespesas numeric(15,2);
  Vdesconto numeric(15,2);
  Vpercipi numeric(15,2);
  Vvaloripi numeric(15,2);
  Vvalorii numeric(15,2);
  Vbaseicms numeric(15,2);
  Vpercicms numeric(15,2);
  Vvaloricms numeric(15,2); 
  Vbaseicmsst numeric(15,2);
  Vvaloricmsst numeric(15,2);
  Vtotal numeric(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valorfrete), 0), COALESCE(SUM(seguro), 0), 
		 COALESCE(SUM(outrasdespesas), 0), COALESCE(SUM(desconto), 0), COALESCE(SUM(percipi), 0), 
		 COALESCE(SUM(valoripi), 0), COALESCE(SUM(valorii), 0), COALESCE(SUM(baseicms), 0), 
		 COALESCE(SUM(percicms), 0), COALESCE(SUM(valoricms), 0), COALESCE(SUM(baseicmsst), 0), 
		 COALESCE(SUM(valoricmsst), 0), COALESCE(SUM(total), 0)
    INTO Vsubtotal, Vvalorfrete, Vseguro, Voutrasdespesas, Vdesconto, Vpercipi, Vvaloripi, Vvalorii,
		 Vbaseicms, Vpercicms, Vvaloricms, Vbaseicmsst, Vvaloricmsst, Vtotal
    FROM cygni.cotacaoprecoitens
   WHERE idempresa = NEW.idempresa
	 AND idorcamento = NEW.idorcamento;
	
  UPDATE cygni.cotacaoprecos
     SET subtotal = Vsubtotal,
		 valorfrete = Vvalorfrete,
		 seguro = Vseguro,
		 outrasdespesas = Voutrasdespesas,
		 desconto = Vdesconto,
		 percipi = Vpercipi,
		 valoripi = Vvaloripi,
		 valorii = Vvalorii,
		 baseicms = Vbaseicms,
		 percicms = Vpercicms,
		 valoricms = Vvaloricms, 
		 baseicmsst = Vbaseicmsst,
		 valoricmsst = Vvaloricmsst,
		 total = Vtotal
  WHERE idempresa = NEW.idempresa
	AND idorcamento = NEW.idorcamento;
	
  RETURN NEW;   
END
$BODY$;

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_cotacaoprecoitens_aud()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
  Vsubtotal numeric(15,2);
  Vvalorfrete numeric(15,2);
  Vseguro numeric(15,2);
  Voutrasdespesas numeric(15,2);
  Vdesconto numeric(15,2);
  Vpercipi numeric(15,2);
  Vvaloripi numeric(15,2);
  Vvalorii numeric(15,2);
  Vbaseicms numeric(15,2);
  Vpercicms numeric(15,2);
  Vvaloricms numeric(15,2); 
  Vbaseicmsst numeric(15,2);
  Vvaloricmsst numeric(15,2);
  Vtotal numeric(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valorfrete), 0), COALESCE(SUM(seguro), 0), 
		 COALESCE(SUM(outrasdespesas), 0), COALESCE(SUM(desconto), 0), COALESCE(SUM(percipi), 0), 
		 COALESCE(SUM(valoripi), 0), COALESCE(SUM(valorii), 0), COALESCE(SUM(baseicms), 0), 
		 COALESCE(SUM(percicms), 0), COALESCE(SUM(valoricms), 0), COALESCE(SUM(baseicmsst), 0), 
		 COALESCE(SUM(valoricmsst), 0), COALESCE(SUM(total), 0)
    INTO Vsubtotal, Vvalorfrete, Vseguro, Voutrasdespesas, Vdesconto, Vpercipi, Vvaloripi, Vvalorii,
		 Vbaseicms, Vpercicms, Vvaloricms, Vbaseicmsst, Vvaloricmsst, Vtotal
	FROM cygni.cotacaoprecoitens
   WHERE idempresa = OLD.idempresa
	 AND idcotacaopreco = OLD.idcotacaopreco;
	
  UPDATE cygni.cotacaoprecos
     SET subtotal = Vsubtotal,
		 valorfrete = Vvalorfrete,
		 seguro = Vseguro,
		 outrasdespesas = Voutrasdespesas,
		 desconto = Vdesconto,
		 percipi = Vpercipi,
		 valoripi = Vvaloripi,
		 valorii = Vvalorii,
		 baseicms = Vbaseicms,
		 percicms = Vpercicms,
		 valoricms = Vvaloricms, 
		 baseicmsst = Vbaseicmsst,
		 valoricmsst = Vvaloricmsst,
		 total = Vtotal
   WHERE idempresa = OLD.idempresa
     AND idcotacaopreco = OLD.idcotacaopreco;
	
  RETURN OLD;   
END
$BODY$;

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_cotacaoprecoitens_ai
    AFTER INSERT
    ON cygni.cotacaoprecoitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_cotacaoprecoitens();

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_cotacaoprecoitens_au
    AFTER UPDATE
    ON cygni.cotacaoprecoitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_cotacaoprecoitens_aud();

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_cotacaoprecoitens_ad
    AFTER DELETE
    ON cygni.cotacaoprecoitens
    FOR EACH ROW
	EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_cotacaoprecoitens_aud();

CREATE OR REPLACE PROCEDURE cygni.sp_export_contacaoprecoitensfornecedores(
	IN pidempresa integer,
	IN pidcontacaopreco integer,
	IN pitem integer,
	IN pfornecedores integer[])
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vreg record;
  Vidfornecedor integer;
BEGIN
  FOR Vreg IN SELECT item, idproduto, quantidade, valorunitario,  
                     subtotal, valorfrete, seguro, outrasdespesas, desconto, 
					 percipi, valoripi, valorii, baseicms, percicms, valoricms, 
					 baseicmsst, valoricmsst, total, status 
	            FROM cygni.contacaoprecoitens 
		       WHERE idempresa = pidempresa
				 AND idcontacaopreco = pidcontacaopreco
	LOOP
      FOREACH Vidfornecedor IN ARRAY pfornecedores
		LOOP
		  INSERT INTO cygni.contacaoprecoitensfornecedores 
			VALUES(pidempresa, pidcontacaopreco, pitem, cygni.getproxitemcontacaoprecoitensfornecedores(
					pidempresa, pidcontacaopreco, pitem), Vidfornecedor, Vreg.idproduto, Vreg.quantidade, 
					Vreg.valorunitario, Vreg.subtotal, Vreg.valorfrete, Vreg.seguro, Vreg.outrasdespesas, 
				    Vreg.desconto, Vreg.percipi, Vreg.valoripi, Vreg.valorii, Vreg.baseicms, Vreg.percicms, 
				    Vreg.valoricms, Vreg.baseicmsst, Vreg.valoricmsst, Vreg.total, Vreg.status
				  );
		END LOOP;
	END LOOP;  
END; 
$BODY$;

CREATE TABLE IF NOT EXISTS cygni.pedidocompras(
	idempresa integer not null,
	idpedidocompra integer not null,
	idorcamento integer not null,
	dtemisao timestamp with time zone,
	idfornecedor integer not null,
	idfuncionario integer not null,
	idtransportador integer not null,
	modalidadefrete integer not null,
	prazoentrega integer not null,
	pesebruto numeric(15,2) DEFAULT 0,
	peseliquido numeric(15,2) DEFAULT 0,
	validade date not null,
	observacoes text,
	subtotal numeric(15,2) DEFAULT 0,
	valoripi numeric(15,2) DEFAULT 0,
	percicms numeric(15,2)  DEFAULT 0,
	desconto numeric(15,2) DEFAULT 0,
	total numeric(15,2) DEFAULT 0, 
	status smallint default 0,
	CONSTRAINT PK_idpedidocompras PRIMARY KEY(idempresa, idpedidocompra),
	CONSTRAINT FK_EMP_PEC FOREIGN KEY(idempresa) REFERENCES cygni.empresas(idempresa),
	CONSTRAINT FK_ORC_PEC FOREIGN KEY(idempresa, idorcamento) REFERENCES cygni.orcamentos(idempresa, idorcamento),
	CONSTRAINT FK_FORN_PEC FOREIGN KEY(idfornecedor) REFERENCES cygni.fornecedores(idfornecedor),
	CONSTRAINT FK_FUN_PEC FOREIGN KEY(idfuncionario) REFERENCES cygni.funcionarios(idfuncionario),
	CONSTRAINT FK_TRAN_PEC FOREIGN KEY(idtransportador) REFERENCES cygni.transportadores(idtransportador)
);

CREATE SEQUENCE IF NOT EXISTS cygni.SEQ_pedidoidpedidocompras;

CREATE TABLE IF NOT EXISTS cygni.pedidocompraitens(
    idempresa integer NOT NULL,
    idpedidocompra integer NOT NULL,
    item integer NOT NULL,
    idproduto integer NOT NULL,
    quantidade numeric(15,2) NOT NULL,
    valorunitario numeric(15,2) NOT NULL,
    subtotal numeric(15,2) NOT NULL,
    valoripi numeric(15,2) DEFAULT 0,
    percicms numeric(15,2) NOT NULL,
    desconto numeric(15,2) NOT NULL,
    total numeric(15,2) NOT NULL,
    CONSTRAINT PK_pedidocompraitens PRIMARY KEY (idempresa, idpedidocompra, item),
    CONSTRAINT FK_EMP_PCI FOREIGN KEY (idempresa)
        REFERENCES cygni.empresas (idempresa),
    CONSTRAINT FK_PRO_PCI FOREIGN KEY (idproduto)
        REFERENCES cygni.produtos (idproduto)
);

CREATE OR REPLACE FUNCTION cygni.getproxitempedidocompraitens(
	pidempresa integer,
	pidpedidocompra integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  VProxItem integer;
BEGIN
  SELECT COALESCE(MAX(item), 0) +1 
    INTO VProxItem 
    FROM cygni.pedidocompraitens
   WHERE idempresa = pidempresa 
	 AND idpedidocompra = pidpedidocompra;
  
  RETURN VProxItem;
END; 
$BODY$;

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_pedidocompraitens()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vsubtotal NUMERIC(15,2);
  Vvaloripi NUMERIC(15,2);
  Vpercicms NUMERIC(15,2);
  Vdesconto NUMERIC(15,2);
  Vtotal NUMERIC(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valoripi), 0), COALESCE(SUM(percicms), 0), 
         COALESCE(SUM(desconto), 0), COALESCE(SUM(total), 0)  
    INTO Vsubtotal, Vvaloripi, Vpercicms, Vdesconto, Vtotal
    FROM cygni.pedidocompraitens
   WHERE idempresa = NEW.idempresa
	 AND idpedidocompra = NEW.idpedidocompra;
	
  UPDATE cygni.pedidocompras
     SET subtotal = Vsubtotal,
	     valoripi = Vvaloripi,
	     percicms = Vpercicms,
		 desconto = Vdesconto,
		 total = Vtotal
  WHERE idempresa = NEW.idempresa
	AND idpedidocompra = NEW.idpedidocompra;
	
  RETURN NEW;   
END
$BODY$;

CREATE OR REPLACE FUNCTION cygni.fun_atualizar_totalizadores_pedidocompraitens_aud()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vsubtotal NUMERIC(15,2);
  Vvaloripi NUMERIC(15,2);
  Vpercicms NUMERIC(15,2);
  Vdesconto NUMERIC(15,2);
  Vtotal NUMERIC(15,2);
BEGIN
  SELECT COALESCE(SUM(subtotal), 0), COALESCE(SUM(valoripi), 0), COALESCE(SUM(percicms), 0), 
         COALESCE(SUM(desconto), 0), COALESCE(SUM(total), 0) 
    INTO Vsubtotal, Vvaloripi, Vpercicms, Vdesconto, Vtotal
    FROM cygni.pedidocompraitens
   WHERE idempresa = OLD.idempresa
	 AND idpedidocompra = OLD.idpedidocompra;
	
  UPDATE cygni.pedidocompras
     SET subtotal = Vsubtotal,
	     valoripi = Vvaloripi,
		 percicms = Vpercicms,
	     desconto = Vdesconto,
		 total = Vtotal
  WHERE idempresa = OLD.idempresa
	AND idpedidocompra = OLD.idpedidocompra;
	
  RETURN OLD;   
END
$BODY$;

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_pedidocompraitens_ai
    AFTER INSERT
    ON cygni.pedidocompraitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_pedidocompraitens();

CREATE OR REPLACE TRIGGER trg_atualizar_totalizadores_pedidocompraitens_au
    AFTER UPDATE
    ON cygni.pedidocompraitens
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_pedidocompraitens_aud();

CREATE TRIGGER trg_atualizar_totalizadores_pedidocompraitens_ad
    AFTER DELETE
    ON cygni.pedidocompras
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_atualizar_totalizadores_pedidocompraitens_aud();

CREATE OR REPLACE FUNCTION cygni.fun_validar_ncm_produtos()
    RETURNS trigger
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vncm varchar(8);
BEGIN
  SELECT ncm 
    INTO Vncm
    FROM cygni.ncm
   WHERE ncm = NEW.ncm;
   
  IF Vncm ISNULL THEN
      RAISE EXCEPTION 'NCM não cadastrado.';  
  END IF;
  
  RETURN NEW;   
END
$BODY$;

CREATE OR REPLACE TRIGGER trg_validar_ncm_produtos_bi
    BEFORE INSERT
    ON cygni.produtos
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_validar_ncm_produtos();

CREATE OR REPLACE TRIGGER trg_validar_ncm_produtos_bu
    BEFORE UPDATE
    ON cygni.produtos
    FOR EACH ROW
    EXECUTE FUNCTION cygni.fun_validar_ncm_produtos();
	
CREATE TABLE cygni.imagens(
	idimagem integer not null,
	foto bytea
);

CREATE OR REPLACE FUNCTION cygni.fun_import_file(ppath text, presult out bytea)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vfile OID;
BEGIN
	SELECT lo_import(ppath) 
	  INTO Vfile;
	  
	SELECT lo_get(Vfile)
	  INTO presult;
	  
	PERFORM lo_unlink(Vfile);
END
$BODY$

CREATE OR REPLACE FUNCTION cygni.getproxitemcotacaoprecoitensfornecedores(
	pidempresa integer,
	pidcotacaopreco integer,
    pidcotacaoprecoitem integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  VProxItem integer;
BEGIN
  SELECT COALESCE(max(item), 0) +1 
    INTO VProxItem 
    FROM cygni.cotacaoprecoitensfornecedores
   WHERE idempresa = pidempresa 
	 AND idcotacaopreco = pidcotacaopreco
	 AND idcotacaoprecoitem = pidcotacaoprecoitem;
  
  RETURN VProxItem;
END; 
$BODY$;

CREATE OR REPLACE PROCEDURE cygni.sp_export_cotacaoprecoitensfornecedores(
	pidempresa integer,
	pidcotacaopreco integer,
    pitem integer,
    pfornecedores integer [])
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vreg record;
  Vidfornecedor integer;
BEGIN
  FOR Vreg IN SELECT item, idproduto, quantidade, valorunitario,  
	                 subtotal, valorfrete, seguro, outrasdespesas, desconto, 
					 percipi, valoripi, valorii, baseicms, percicms, valoricms, 
					 baseicmsst, valoricmsst, total, status
				FROM cygni.cotacaoprecoitens 
		       WHERE idempresa = pidempresa
				 AND idcotacaopreco = pidcotacaopreco
	LOOP
      FOREACH Vidfornecedor IN ARRAY pfornecedores
		LOOP
		  INSERT INTO cygni.cotacaoprecoitensfornecedores 
			VALUES(pidempresa, pidcotacaopreco, pitem, cygni.getproxitemcotacaoprecoitensfornecedores(
					pidempresa, pidcotacaopreco, pitem), Vidfornecedor, Vreg.idproduto, Vreg.quantidade, 
					Vreg.valorunitario, Vreg.subtotal, Vreg.valorfrete, Vreg.seguro, Vreg.outrasdespesas, 
				    Vreg.desconto, Vreg.percipi, Vreg.valoripi, Vreg.valorii, Vreg.baseicms, Vreg.percicms, 
				    Vreg.valoricms, Vreg.baseicmsst, Vreg.valoricmsst, Vreg.total, Vreg.status
				  );
		END LOOP;
	END LOOP;  
END; 
$BODY$;

CREATE OR REPLACE FUNCTION cygni.getprecocompraproduto(
	pidproduto integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vprecocompra NUMERIC(15,2);
BEGIN
  SELECT precocompra 
    INTO Vprecocompra 
	FROM cygni.produtos 
   WHERE idproduto = pidproduto;
  
  RETURN Vprecocompra;
END; 
$BODY$;

CREATE OR REPLACE PROCEDURE cygni.sp_aplicar_menlhor_preco_produto(
	IN pidempresa integer,
	IN pidcotacaopreco integer)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  Vreg record;
  Vidproduto integer;
  Vidfornecedor integer;
  Visprocessado boolean;
BEGIN
  SELECT isprocessado
    INTO Visprocessado
	FROM cygni.cotacaoprecos
   WHERE idempresa = pidempresa
	 AND idcotacaopreco = pidcotacaopreco;
	 
  IF (Visprocessado) THEN
      RAISE EXCEPTION 'Cotação de Preços já esta processada.';
  END IF;
  
  FOR Vreg IN SELECT DISTINCT CPFI.idproduto,
                     CPFI.idfornecedor,
                     MIN(CPFI.valorunitario) valorunitario,
					 CPFI.idcotacaoprecoitem,
					 CPFI.item,
					 CPFI.quantidade,
					 CPFI.subtotal, 
					 CPFI.valorfrete, 
					 CPFI.seguro, 
					 CPFI.outrasdespesas, 
					 CPFI.desconto, 
					 CPFI.percipi, 
					 CPFI.valoripi, 
					 CPFI.valorii, 
					 CPFI.baseicms, 
					 CPFI.percicms, 
					 CPFI.valoricms, 
					 CPFI.baseicmsst, 
					 CPFI.valoricmsst, 
					 CPFI.total,
					 CPFI.ismelhorpreco
				FROM cygni.cotacaoprecoitensfornecedores CPFI
			   WHERE idempresa = pidempresa
	             AND idcotacaopreco = pidcotacaopreco
			--   AND CPFI.valorunitario > 0.00
			GROUP BY CPFI.idproduto,
		             CPFI.idfornecedor,
			         CPFI.valorunitario,
					 CPFI.idcotacaoprecoitem,
					 CPFI.item,
					 CPFI.quantidade,
					 CPFI.subtotal,
					 CPFI.valorfrete, 
					 CPFI.seguro, 
					 CPFI.outrasdespesas, 
					 CPFI.desconto, 
					 CPFI.percipi, 
					 CPFI.valoripi, 
					 CPFI.valorii, 
					 CPFI.baseicms, 
					 CPFI.percicms, 
					 CPFI.valoricms, 
					 CPFI.baseicmsst, 
					 CPFI.valoricmsst, 
					 CPFI.total,
				     CPFI.ismelhorpreco
	        ORDER BY MIN(CPFI.valorunitario)
  	LOOP
	  IF (Vidproduto <> Vreg.idproduto) AND (Vidfornecedor <> Vreg.idfornecedor) THEN
	    Vidproduto := Vreg.idproduto; 
        Vidfornecedor := Vreg.idfornecedor;
		
		UPDATE cygni.cotacaoprecoitensfornecedores
		   SET ismelhorpreco = true
		 WHERE idempresa = pidempresa
	       AND idcotacaopreco = pidcotacaopreco
		   AND idcotacaoprecoitem = Vreg.idcotacaoprecoitem
		   AND item = Vreg.item;
		   
		UPDATE cygni.cotacaoprecoitens
		   SET valorunitario = Vreg.valorunitario,
		       quantidade = Vreg.quantidade,
			   subtotal = Vreg.subtotal,
			   valorfrete = Vreg.valorfrete, 
			   seguro = Vreg.seguro, 
			   outrasdespesas = Vreg.outrasdespesas, 
			   desconto = Vreg.desconto, 
			   percipi = Vreg.percipi, 
			   valoripi = Vreg.valoripi, 
			   valorii = Vreg.valorii, 
			   baseicms = Vreg.baseicms, 
			   percicms = Vreg.percicms, 
			   valoricms = Vreg.valoricms, 
			   baseicmsst = Vreg.baseicmsst, 
			   valoricmsst = Vreg.valoricmsst, 
			   total = Vreg.total
		 WHERE idempresa = pidempresa
	       AND idcotacaopreco = pidcotacaopreco
		   AND item = Vreg.idcotacaoprecoitem;
	  END IF;
	END LOOP;
	
  UPDATE cygni.cotacaoprecos
     SET isprocessado = true
   WHERE idempresa = pidempresa
	 AND idcotacaopreco = pidcotacaopreco;
END; 
$BODY$;

