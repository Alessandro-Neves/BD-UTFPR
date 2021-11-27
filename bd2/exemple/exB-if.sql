create or replace function verificaIdade(in age integer, in vec varchar(20), in nome varchar(30)) returns varchar(20) as
$$
begin
    if(age >= 18) then
  	    if (age = 18)	then return format('%s acabou de fazer 18 e está de %s. Parabéns!', nome, vec);
        elseif (age > 18) then return format('%s é maior que 18 anos e está de %s',nome, vec);
        end if;
    else return format('%s é menor de idade', nome);
    end if;
    end;
$$
language plpgsql;

select bafometro(17, 'bicicleta', 'Lucas');
select bafometro(18, 'carro', 'gabriela');
select bafometro(19, 'moto', 'Kaio');