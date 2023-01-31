

UPDATE cygni.cotacaoprecoitensfornecedores 
   SET valorunitario = 800.0,
	   subtotal = quantidade * valorunitario,
	   valorfrete = 25,
	   seguro = 10,
	   outrasdespesas = 0,
	   desconto = 0,
	   percipi = 18,
	   valoripi = subtotal * 0.18,
	   valorii = ((subtotal * 0.6) + frete + seguro),
	   baseicms = ((subtotal + frete + seguro + outrasdespesas)-desconto),
	   percicms = 17,
	   valoricms = (baseicms * 0.17), 
	   baseicmsst = (subtotal + valoripi + valorfrete + seguro + outrasdespesas) * 1.5,
	   valoricmsst = (((baseicmsst * percicms)/100) - valoricms),
	   total = ((subtotal + valoricmsst + valorfrete + seguro + outrasdespesas + valorii + valoripi) - 
	            desconto)
	WHERE idempresa = 1
      AND idcontacaopreco = 1
	  AND idcontacaoprecoitem = 1
	  AND item = 1;
	  
UPDATE cygni.contacaoprecoitensfornecedores 
   SET valorunitario = 855.0  
	WHERE idempresa = 1
      AND idcontacaopreco = 1
	  AND idcontacaoprecoitem = 1
	  AND item = 2;	  
	  
UPDATE cygni.contacaoprecoitensfornecedores 
   SET valorunitario = 800.0  
	WHERE idempresa = 1
      AND idcontacaopreco = 1
	  AND idcontacaoprecoitem = 1
	  AND item = 3;	  