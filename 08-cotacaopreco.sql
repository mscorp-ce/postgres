INSERT INTO cygni.empresas(
	idempresa, razaosocial, nomefantasia, cnpj, inscricaoestadual, inscricaomunicipal, cnae, crt, celular, 
	telefone, ramal, fax, email)
	VALUES (nextval('cygni.SEQ_empresas'), 'PRISMA TECHNOLOGIES LTDA', 'PRISMA TECHNOLOGIES', '92030518000196', 
			NULL, NULL, '62.01-5-01', '016478', '85988335012', '85988335012', NULL, NULL, 
			'marcio.silva@prismatechnologies.com.br');

INSERT INTO cygni.funcionarios(
	idfuncionario, nome, dtnascimento, genero, idcargo, dtcontratacao, cpf, rg, orgooexpedidor, dtemissao,
	foto, estadocivil, celular, telefone, ramal, email, observacao, status)
	VALUES (nextval('cygni.SEQ_funcionarios'), 'JULIA', TO_TIMESTAMP('2016-05-07 10:45:00','YYYYMMDD HH:MM:SS'),
			1, 1, CURRENT_DATE, 
			'79318072007', '93578839600', 'SSPCE', TO_DATE('20160510','YYYYMMDD'),  
			lo_import('E:\dev\dados\cygnus\telas\julia.png'), 1, '85988308551', '8532618813', '', 
			'julia@prismatechnologies.com.br', '', 1);

INSERT INTO cygni.funcionarios(
	idfuncionario, nome, dtnascimento, genero, idcargo, dtcontratacao, cpf, rg, orgooexpedidor, dtemissao, 
	foto, estadocivil, celular, telefone, ramal, email, observacao, status)
	VALUES (nextval('cygni.SEQ_funcionarios'), 'CAMILA', TO_TIMESTAMP('2001-06-21 10:45:00','YYYYMMDD HH:MM:SS'),
			1, 2, CURRENT_DATE, '96562513006', '11326843901', 'SSPCE', TO_DATE('20180501','YYYYMMDD'), 
			lo_import('E:\dev\dados\cygnus\telas\bea.png'), 1, '85998145612', '85998145612', '',  
			'camila@prismatechnologies.com.br', '', 1);

INSERT INTO cygni.funcionarios(
	idfuncionario, nome, dtnascimento, genero, idcargo, dtcontratacao, cpf, rg, orgooexpedidor, dtemissao,
	foto, estadocivil, celular, telefone, ramal, email, observacao, status)
	VALUES (nextval('cygni.SEQ_funcionarios'), 'YZABELY', TO_TIMESTAMP('2003-08-25 10:45:00','YYYYMMDD HH:MM:SS'),
			1, 3, CURRENT_DATE, '68379091000', '92438577705', 'SSPCE', TO_DATE('20150620','YYYYMMDD'),  
			lo_import('E:\dev\dados\cygnus\telas\yza.png'), 1, '85987124510', '85987124510', '', 
			'yzabely@prismatechnologies.com.br', '', 1);

INSERT INTO cygni.transportadores(
	idtransportador, tipopessoa, nome, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, orgooexpedidor, 
	dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_transportadores'), 0, 'Transportadora MULTICARGAS', to_date('20220107','YYYYMMDD'), 
			0, '04974172000117', '66384223645', '',  null, lo_import('E:\dev\dados\cygnus\telas\multicargas.jpg'), 
			null, '85988510014', '8532781452', '9', '8532781455', 'igor@aconta.com.br', null, 0);
			

INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'TECNO INDUSTRIA E COMERCIO DE COMPUTADORES LTDA', 'IBYTE', 1, 
			TO_DATE('20120725','YYYYMMDD'), null, '07272825000104', '19284895001', null, null, 
			lo_import('E:\dev\dados\cygnus\telas\ibyte-3.jpeg'), null, '8597350155', '8535354469', 
			'9', '8535354460', 'fmarinho@ibyte.com.br', null, 0);
			
INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'JAB COMERCIO E DISTRIBUICAO DE ELETRO E ELETRONICO LTDA', 
			'SMART ELETRON', 1, TO_DATE('19980316','YYYYMMDD'), null, '16571889000105', '38447702022', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\smarteletron.jpg'), null, '8532011350', '8540055000', 
			'9', '8532011391', 'contabilidade.jab@hotmail.com', null, 0);

INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'R.A FABRICACAO DE MOVEIS PARA ESCRITORIO LTDA', 
			'DUANA MOVEIS', 1, TO_DATE('20100705','YYYYMMDD'), null, '07598225000300', '76886737115', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\duana.png'), null, '85988741735', '8532314747', 
			'9', '8532314741', 'evania@duanamoveis.com.br', null, 0);			

INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'R.A FABRICACAO DE MOVEIS PARA ESCRITORIO LTDA', 
			'DUANA MOVEIS', 1, TO_DATE('20100705','YYYYMMDD'), null, '07598225000300', '76886737115', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\duana.png'), null, '85988741735', '8532314747', 
			'9', '8532314741', 'evania@duanamoveis.com.br', null, 0);
			
INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'RHEMA INDUSTRIA E COMERCIO LTDA', 
			'RHEMA MOVEIS', 1, TO_DATE('19991101','YYYYMMDD'), null, '57954599702', '76886737115', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\rhena.png'), null, '85988741735', '8532314516', 
			'9', '85323145111', 'eliane@rhenamoveis.com.br', null, 0);
			
INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'O & M INDUSTRIA E COMERCIO DE MOVEIS PARA ESCRITORIO LTDA', 
			'FAMOBIL MOVEIS', 1, TO_DATE('19990714','YYYYMMDD'), null, '03279261000180', '82481869907', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\famobil.png'), null, '85981164425', '8532212087', 
			'9', '853221-2081', 'comercial@famobilmoveis.com.br', null, 0);
			
INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'MAGAZINE DISTRIBUIDORA DE ELETRODOMESTICOS LTDA', 
			'LOJAS MAGAZINE LUIZA', 1, TO_DATE('20221018	','YYYYMMDD'), null, '48321857000130', '76886737115', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\magazineluiza.png'), null, '85984320145', '8532167899', 
			'9', '8532167891', 'comercila@magazineluiza.com.br', null, 0);

INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'LOJAS INSINUANTE S.A.', 'LOJAS INSINUANTE', 1, 
			TO_DATE('20090502','YYYYMMDD'), null, '16182834031670', '58320831207', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\insinuate.png'), null, '7133798727', '7133798726', 
			'9', '7133798721', 'comercial@insinuate.com.br', null, 0);
			
INSERT INTO cygni.fornecedores(
	idfornecedor, tipopessoa, nome, fantasia, idcategoria, dtnascimento, genero, cpf_cnpj, rg_inscricaoestadual, 
	orgooexpedidor, dtemissao, foto, estadocivil, celular, telefone, ramal, fax, email, observacao, status)
	VALUES (nextval('cygni.SEQ_fornecedores'), 1, 'COMERCIAL DE ALIMENTOS CARREFOUR LTDA', 
			'LOJAS CARREFOUR', 1, TO_DATE('19720504	','YYYYMMDD'), null, '62545579000478', '1137796000', null, 
			null, lo_import('E:\dev\dados\cygnus\telas\carrefour.jpg'), null, '85984320145', '8532167899', 
			'9', '1137796001', 'comercila@carrefour.com.br', null, 0);

INSERT INTO cygni.cotacaoprecos(
	idempresa, idcotacaopreco, dataemissao, idfuncionario, idtranspotador, idformapagamento subtotal, valoripi, percicms, desconto, total, status)
	VALUES (1, nextval('cygni.SEQ_cotacaoprecos'), CURRENT_TIMESTAMP, 1, 1, 1, 0, 0, 0, 0, 0, 0);

INSERT INTO cygni.marcas
	VALUES (nextval('cygni.SEQ_marcas'), 'SAMSUNG');
INSERT INTO cygni.marcas
	VALUES (nextval('cygni.SEQ_marcas'), 'AOC');
INSERT INTO cygni.marcas
	VALUES (nextval('cygni.SEQ_marcas'), 'DELL');
INSERT INTO cygni.marcas
	VALUES (nextval('cygni.SEQ_marcas'), 'FABER CASTEL');
INSERT INTO cygni.marcas
	VALUES (nextval('cygni.SEQ_marcas'), 'TALIMPO');

INSERT INTO cygni.unidades
	VALUES (nextval('cygni.SEQ_unidades'), 'UN', 'UNIDADE');

INSERT INTO cygni.produtos(
	idproduto, nome, idmarca, idprodutocategoria, idunidade, ean, ncm, idorigem, precocompra, precovenda, 
	customedio, saldo, estoqueminimo, estoquemaximo, pesobruto, pesoliquido, observacao, status)
	VALUES (nextval('cygni.SEQ_produtos'), 'MONITOR SAMSUNG 22', 2, 8, 1, '8949461894984', '85282110', 1, 500, 
			1200, 500, 0, 20, 30, 5, 4.5, null, 0);

INSERT INTO cygni.produtos(
	idproduto, nome, idmarca, idprodutocategoria, idunidade, ean, ncm, idorigem, precocompra, precovenda, 
	customedio, saldo, estoqueminimo, estoquemaximo, pesobruto, pesoliquido, observacao, status)
	VALUES (nextval('cygni.SEQ_produtos'), 'CADEIRA GAMER', 2, 8, 1, '9751115554445', '94013090', 1, 800, 
			1600, 800, 0, 10, 20, 8, 7, null, 0);

INSERT INTO cygni.produtos(
	idproduto, nome, idmarca, idprodutocategoria, idunidade, ean, ncm, idorigem, precocompra, precovenda, 
	customedio, saldo, estoqueminimo, estoquemaximo, pesobruto, pesoliquido, observacao, status)
	VALUES (nextval('cygni.SEQ_produtos'), 'MESA DIRETOR 1.70X80', 2, 8, 1, '6548964631668', '94033000', 1, 700, 
			10000, 700, 0, 8, 12, 10, 9, null, 0);

INSERT INTO cygni.produtos(
	idproduto, nome, idmarca, idprodutocategoria, idunidade, ean, ncm, idorigem, precocompra, precovenda, 
	customedio, saldo, estoqueminimo, estoquemaximo, pesobruto, pesoliquido, observacao, status)
	VALUES (nextval('cygni.SEQ_produtos'), 'AR CONDICIONADO', 2, 8, 1, '7891129098404', '84151090', 1, 900, 
			1800, 900, 0, 15, 25, 5, 4, null, 0);

INSERT INTO cygni.produtos(
	idproduto, nome, idmarca, idprodutocategoria, idunidade, ean, ncm, idorigem, precocompra, precovenda, 
	customedio, saldo, estoqueminimo, estoquemaximo, pesobruto, pesoliquido, observacao, status)
	VALUES (nextval('cygni.SEQ_produtos'), 'DESINFETANTE KALIPTO', 2, 8, 1, '8949461894984', '38084010', 1, 5, 
			9, 5, 0, 10, 15, 2, 2.2, null, 0);

INSERT INTO cygni.contacaoprecoitens(
	idempresa, idcontacaopreco, item, idproduto, quantidade, valorunitario, subtotal, 
	valoripi, percicms, desconto, total, status)
	VALUES (1, 1, cygni.getproxitemcontacaoprecoitens(1, 1), 1, 10, 0, 0, 0, 0, 0, 0, 0);
	
INSERT INTO cygni.contacaoprecoitens(
	idempresa, idcontacaopreco, item, idproduto, quantidade, valorunitario, subtotal, 
	valoripi, percicms, desconto, total, status)
	VALUES (1, 1, cygni.getproxitemcontacaoprecoitens(1, 1), 2, 4, 0, 0, 0, 0, 0, 0, 0);
	
INSERT INTO cygni.contacaoprecoitens(
	idempresa, idcontacaopreco, item, idproduto, quantidade, valorunitario, subtotal, 
	valoripi, percicms, desconto, total, status)
	VALUES (1, 1, cygni.getproxitemcontacaoprecoitens(1, 1), 3, 5, 0, 0, 0, 0, 0, 0, 0);
	
INSERT INTO cygni.contacaoprecoitens(
	idempresa, idcontacaopreco, item, idproduto, quantidade, valorunitario, subtotal, 
	valoripi, percicms, desconto, total, status)
	VALUES (1, 1, cygni.getproxitemcontacaoprecoitens(1, 1), 3, 7, 0, 0, 0, 0, 0, 0, 0);
	
INSERT INTO cygni.produtofornecedores(
	idproduto, idfornecedor, precocompra)
	VALUES (1, 1, cygni.getprecocompraproduto(1));
	
INSERT INTO cygni.produtofornecedores(
	idproduto, idfornecedor, precocompra)
	VALUES (1, 2, cygni.getprecocompraproduto(1));

INSERT INTO cygni.produtofornecedores(
	idproduto, idfornecedor, precocompra)
	VALUES (1, 3, cygni.getprecocompraproduto(1));

INSERT INTO cygni.produtofornecedores(
	idproduto, idfornecedor, precocompra)
	VALUES (2, 4, cygni.getprecocompraproduto(1));
	
INSERT INTO cygni.produtofornecedores(
	idproduto, idfornecedor, precocompra)
	VALUES (2, 5, cygni.getprecocompraproduto(1));

INSERT INTO cygni.produtofornecedores(
	idproduto, idfornecedor, precocompra)
	VALUES (2, 6, cygni.getprecocompraproduto(1));
