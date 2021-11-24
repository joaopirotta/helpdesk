PGDMP     ;    
            
    y            helpdesk    13.4    13.4 J               0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    helpdesk    DATABASE     X   CREATE DATABASE helpdesk WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LOCALE = 'C';
    DROP DATABASE helpdesk;
                postgres    false            �            1255    16525 "   remover_acentos(character varying)    FUNCTION     �   CREATE FUNCTION public.remover_acentos(character varying) RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT translate($1, '����������������������������������������������', 'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC')
$_$;
 9   DROP FUNCTION public.remover_acentos(character varying);
       public          postgres    false            �            1259    16605    sys_controle_acesso    TABLE     e  CREATE TABLE public.sys_controle_acesso (
    idcontrole_acesso integer NOT NULL,
    idusuario integer,
    idtela integer,
    visualizar boolean DEFAULT false,
    editar boolean DEFAULT false,
    dt_inc date DEFAULT ('now'::text)::date,
    hr_inc time(0) without time zone DEFAULT ('now'::text)::time with time zone,
    ativo boolean DEFAULT true
);
 '   DROP TABLE public.sys_controle_acesso;
       public         heap    postgres    false            �            1259    16603 )   sys_controle_acesso_idcontrole_acesso_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_controle_acesso_idcontrole_acesso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.sys_controle_acesso_idcontrole_acesso_seq;
       public          postgres    false    217                        0    0 )   sys_controle_acesso_idcontrole_acesso_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.sys_controle_acesso_idcontrole_acesso_seq OWNED BY public.sys_controle_acesso.idcontrole_acesso;
          public          postgres    false    216            �            1259    16484    sys_departamento    TABLE     �   CREATE TABLE public.sys_departamento (
    iddepartamento integer NOT NULL,
    descricao character varying(50) NOT NULL,
    ativo boolean DEFAULT true
);
 $   DROP TABLE public.sys_departamento;
       public         heap    postgres    false            �            1259    16482 #   sys_departamento_iddepartamento_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_departamento_iddepartamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.sys_departamento_iddepartamento_seq;
       public          postgres    false    205            !           0    0 #   sys_departamento_iddepartamento_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.sys_departamento_iddepartamento_seq OWNED BY public.sys_departamento.iddepartamento;
          public          postgres    false    204            �            1259    16543    sys_empresa    TABLE       CREATE TABLE public.sys_empresa (
    idempresa integer NOT NULL,
    cnpj character varying(14) NOT NULL,
    razao_social character varying(255) NOT NULL,
    nome_fantasia character varying(120),
    cep character varying(8) NOT NULL,
    logradouro character varying(255) NOT NULL,
    idmunicipio integer NOT NULL,
    bairro character varying(120) NOT NULL,
    numero character varying(5),
    complemento character varying(255),
    ativo boolean DEFAULT true,
    telefone character varying(20),
    email character varying(255)
);
    DROP TABLE public.sys_empresa;
       public         heap    postgres    false            �            1259    16541    sys_empresa_idempresa_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_empresa_idempresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sys_empresa_idempresa_seq;
       public          postgres    false    209            "           0    0    sys_empresa_idempresa_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.sys_empresa_idempresa_seq OWNED BY public.sys_empresa.idempresa;
          public          postgres    false    208            �            1259    16528    sys_municipio    TABLE     �   CREATE TABLE public.sys_municipio (
    idmunicipio integer NOT NULL,
    codigo_municipio character varying(8) NOT NULL,
    iduf integer NOT NULL,
    municipio character varying(120) NOT NULL,
    ativo boolean DEFAULT true
);
 !   DROP TABLE public.sys_municipio;
       public         heap    postgres    false            �            1259    16526    sys_municipio_idmunicipio_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_municipio_idmunicipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.sys_municipio_idmunicipio_seq;
       public          postgres    false    207            #           0    0    sys_municipio_idmunicipio_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.sys_municipio_idmunicipio_seq OWNED BY public.sys_municipio.idmunicipio;
          public          postgres    false    206            �            1259    16447    sys_pais    TABLE     �   CREATE TABLE public.sys_pais (
    idpais integer NOT NULL,
    codigo_pais character varying(5) NOT NULL,
    nome_pais character varying(255) NOT NULL,
    ativo boolean DEFAULT true
);
    DROP TABLE public.sys_pais;
       public         heap    postgres    false            �            1259    16445    sys_pais_idpais_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_pais_idpais_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sys_pais_idpais_seq;
       public          postgres    false    201            $           0    0    sys_pais_idpais_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.sys_pais_idpais_seq OWNED BY public.sys_pais.idpais;
          public          postgres    false    200            �            1259    16592    sys_tela    TABLE     �  CREATE TABLE public.sys_tela (
    idtela integer NOT NULL,
    descricao character varying(100),
    dt_inc date DEFAULT ('now'::text)::date,
    hr_inc time(0) without time zone DEFAULT ('now'::text)::time with time zone,
    ativo boolean DEFAULT true,
    descricao_web character varying(100),
    caminho character varying(100),
    icone character varying(100),
    idtela_principal integer,
    menu_principal boolean DEFAULT true,
    treeview boolean DEFAULT false
);
    DROP TABLE public.sys_tela;
       public         heap    postgres    false            �            1259    16590    sys_tela_idtela_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_tela_idtela_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sys_tela_idtela_seq;
       public          postgres    false    215            %           0    0    sys_tela_idtela_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.sys_tela_idtela_seq OWNED BY public.sys_tela.idtela;
          public          postgres    false    214            �            1259    16456    sys_uf    TABLE     �   CREATE TABLE public.sys_uf (
    iduf integer NOT NULL,
    codigo_uf character varying(2) NOT NULL,
    idpais integer NOT NULL,
    nome_uf character varying(50) NOT NULL,
    sigla_uf character varying(2) NOT NULL,
    ativo boolean DEFAULT true
);
    DROP TABLE public.sys_uf;
       public         heap    postgres    false            �            1259    16454    sys_uf_iduf_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_uf_iduf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sys_uf_iduf_seq;
       public          postgres    false    203            &           0    0    sys_uf_iduf_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sys_uf_iduf_seq OWNED BY public.sys_uf.iduf;
          public          postgres    false    202            �            1259    16557    sys_usuario    TABLE     a  CREATE TABLE public.sys_usuario (
    idusuario integer NOT NULL,
    idempresa integer NOT NULL,
    cliente boolean DEFAULT true,
    email character varying(255) NOT NULL,
    senha character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    ativo boolean DEFAULT true,
    iddepartamento integer,
    cpf character varying(11)
);
    DROP TABLE public.sys_usuario;
       public         heap    postgres    false            �            1259    16555    sys_usuario_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sys_usuario_idusuario_seq;
       public          postgres    false    211            '           0    0    sys_usuario_idusuario_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.sys_usuario_idusuario_seq OWNED BY public.sys_usuario.idusuario;
          public          postgres    false    210            �            1259    16577    sys_usuario_telefone    TABLE       CREATE TABLE public.sys_usuario_telefone (
    idusuario_telefone integer NOT NULL,
    idusuario integer NOT NULL,
    tipo_telefone integer NOT NULL,
    numero_ddd character varying(2),
    numero_telefone character varying(8) NOT NULL,
    ativo boolean DEFAULT true
);
 (   DROP TABLE public.sys_usuario_telefone;
       public         heap    postgres    false            �            1259    16575 +   sys_usuario_telefone_idusuario_telefone_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_usuario_telefone_idusuario_telefone_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.sys_usuario_telefone_idusuario_telefone_seq;
       public          postgres    false    213            (           0    0 +   sys_usuario_telefone_idusuario_telefone_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.sys_usuario_telefone_idusuario_telefone_seq OWNED BY public.sys_usuario_telefone.idusuario_telefone;
          public          postgres    false    212            h           2604    16608 %   sys_controle_acesso idcontrole_acesso    DEFAULT     �   ALTER TABLE ONLY public.sys_controle_acesso ALTER COLUMN idcontrole_acesso SET DEFAULT nextval('public.sys_controle_acesso_idcontrole_acesso_seq'::regclass);
 T   ALTER TABLE public.sys_controle_acesso ALTER COLUMN idcontrole_acesso DROP DEFAULT;
       public          postgres    false    216    217    217            W           2604    16487    sys_departamento iddepartamento    DEFAULT     �   ALTER TABLE ONLY public.sys_departamento ALTER COLUMN iddepartamento SET DEFAULT nextval('public.sys_departamento_iddepartamento_seq'::regclass);
 N   ALTER TABLE public.sys_departamento ALTER COLUMN iddepartamento DROP DEFAULT;
       public          postgres    false    204    205    205            [           2604    16546    sys_empresa idempresa    DEFAULT     ~   ALTER TABLE ONLY public.sys_empresa ALTER COLUMN idempresa SET DEFAULT nextval('public.sys_empresa_idempresa_seq'::regclass);
 D   ALTER TABLE public.sys_empresa ALTER COLUMN idempresa DROP DEFAULT;
       public          postgres    false    208    209    209            Y           2604    16531    sys_municipio idmunicipio    DEFAULT     �   ALTER TABLE ONLY public.sys_municipio ALTER COLUMN idmunicipio SET DEFAULT nextval('public.sys_municipio_idmunicipio_seq'::regclass);
 H   ALTER TABLE public.sys_municipio ALTER COLUMN idmunicipio DROP DEFAULT;
       public          postgres    false    206    207    207            S           2604    16450    sys_pais idpais    DEFAULT     r   ALTER TABLE ONLY public.sys_pais ALTER COLUMN idpais SET DEFAULT nextval('public.sys_pais_idpais_seq'::regclass);
 >   ALTER TABLE public.sys_pais ALTER COLUMN idpais DROP DEFAULT;
       public          postgres    false    201    200    201            b           2604    16595    sys_tela idtela    DEFAULT     r   ALTER TABLE ONLY public.sys_tela ALTER COLUMN idtela SET DEFAULT nextval('public.sys_tela_idtela_seq'::regclass);
 >   ALTER TABLE public.sys_tela ALTER COLUMN idtela DROP DEFAULT;
       public          postgres    false    215    214    215            U           2604    16459    sys_uf iduf    DEFAULT     j   ALTER TABLE ONLY public.sys_uf ALTER COLUMN iduf SET DEFAULT nextval('public.sys_uf_iduf_seq'::regclass);
 :   ALTER TABLE public.sys_uf ALTER COLUMN iduf DROP DEFAULT;
       public          postgres    false    202    203    203            ]           2604    16560    sys_usuario idusuario    DEFAULT     ~   ALTER TABLE ONLY public.sys_usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.sys_usuario_idusuario_seq'::regclass);
 D   ALTER TABLE public.sys_usuario ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    211    210    211            `           2604    16580 '   sys_usuario_telefone idusuario_telefone    DEFAULT     �   ALTER TABLE ONLY public.sys_usuario_telefone ALTER COLUMN idusuario_telefone SET DEFAULT nextval('public.sys_usuario_telefone_idusuario_telefone_seq'::regclass);
 V   ALTER TABLE public.sys_usuario_telefone ALTER COLUMN idusuario_telefone DROP DEFAULT;
       public          postgres    false    213    212    213                      0    16605    sys_controle_acesso 
   TABLE DATA           ~   COPY public.sys_controle_acesso (idcontrole_acesso, idusuario, idtela, visualizar, editar, dt_inc, hr_inc, ativo) FROM stdin;
    public          postgres    false    217   �_                 0    16484    sys_departamento 
   TABLE DATA           L   COPY public.sys_departamento (iddepartamento, descricao, ativo) FROM stdin;
    public          postgres    false    205   `                 0    16543    sys_empresa 
   TABLE DATA           �   COPY public.sys_empresa (idempresa, cnpj, razao_social, nome_fantasia, cep, logradouro, idmunicipio, bairro, numero, complemento, ativo, telefone, email) FROM stdin;
    public          postgres    false    209   I`                 0    16528    sys_municipio 
   TABLE DATA           ^   COPY public.sys_municipio (idmunicipio, codigo_municipio, iduf, municipio, ativo) FROM stdin;
    public          postgres    false    207   .a       	          0    16447    sys_pais 
   TABLE DATA           I   COPY public.sys_pais (idpais, codigo_pais, nome_pais, ativo) FROM stdin;
    public          postgres    false    201   �V                0    16592    sys_tela 
   TABLE DATA           �   COPY public.sys_tela (idtela, descricao, dt_inc, hr_inc, ativo, descricao_web, caminho, icone, idtela_principal, menu_principal, treeview) FROM stdin;
    public          postgres    false    215   b                0    16456    sys_uf 
   TABLE DATA           S   COPY public.sys_uf (iduf, codigo_uf, idpais, nome_uf, sigla_uf, ativo) FROM stdin;
    public          postgres    false    203   c                0    16557    sys_usuario 
   TABLE DATA           t   COPY public.sys_usuario (idusuario, idempresa, cliente, email, senha, nome, ativo, iddepartamento, cpf) FROM stdin;
    public          postgres    false    211   |d                0    16577    sys_usuario_telefone 
   TABLE DATA           �   COPY public.sys_usuario_telefone (idusuario_telefone, idusuario, tipo_telefone, numero_ddd, numero_telefone, ativo) FROM stdin;
    public          postgres    false    213   �e      )           0    0 )   sys_controle_acesso_idcontrole_acesso_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.sys_controle_acesso_idcontrole_acesso_seq', 4, true);
          public          postgres    false    216            *           0    0 #   sys_departamento_iddepartamento_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.sys_departamento_iddepartamento_seq', 9, true);
          public          postgres    false    204            +           0    0    sys_empresa_idempresa_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sys_empresa_idempresa_seq', 7, true);
          public          postgres    false    208            ,           0    0    sys_municipio_idmunicipio_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.sys_municipio_idmunicipio_seq', 5570, true);
          public          postgres    false    206            -           0    0    sys_pais_idpais_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_pais_idpais_seq', 245, true);
          public          postgres    false    200            .           0    0    sys_tela_idtela_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.sys_tela_idtela_seq', 5, true);
          public          postgres    false    214            /           0    0    sys_uf_iduf_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sys_uf_iduf_seq', 27, true);
          public          postgres    false    202            0           0    0    sys_usuario_idusuario_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sys_usuario_idusuario_seq', 5, true);
          public          postgres    false    210            1           0    0 +   sys_usuario_telefone_idusuario_telefone_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.sys_usuario_telefone_idusuario_telefone_seq', 1, false);
          public          postgres    false    212                       2606    16615 ,   sys_controle_acesso sys_controle_acesso_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.sys_controle_acesso
    ADD CONSTRAINT sys_controle_acesso_pkey PRIMARY KEY (idcontrole_acesso);
 V   ALTER TABLE ONLY public.sys_controle_acesso DROP CONSTRAINT sys_controle_acesso_pkey;
       public            postgres    false    217            s           2606    16489 &   sys_departamento sys_departamento_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.sys_departamento
    ADD CONSTRAINT sys_departamento_pkey PRIMARY KEY (iddepartamento);
 P   ALTER TABLE ONLY public.sys_departamento DROP CONSTRAINT sys_departamento_pkey;
       public            postgres    false    205            w           2606    16549    sys_empresa sys_empresa_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.sys_empresa
    ADD CONSTRAINT sys_empresa_pkey PRIMARY KEY (idempresa);
 F   ALTER TABLE ONLY public.sys_empresa DROP CONSTRAINT sys_empresa_pkey;
       public            postgres    false    209            u           2606    16534     sys_municipio sys_municipio_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.sys_municipio
    ADD CONSTRAINT sys_municipio_pkey PRIMARY KEY (idmunicipio);
 J   ALTER TABLE ONLY public.sys_municipio DROP CONSTRAINT sys_municipio_pkey;
       public            postgres    false    207            o           2606    16453    sys_pais sys_pais_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sys_pais
    ADD CONSTRAINT sys_pais_pkey PRIMARY KEY (idpais);
 @   ALTER TABLE ONLY public.sys_pais DROP CONSTRAINT sys_pais_pkey;
       public            postgres    false    201            }           2606    16602    sys_tela sys_tela_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sys_tela
    ADD CONSTRAINT sys_tela_pkey PRIMARY KEY (idtela);
 @   ALTER TABLE ONLY public.sys_tela DROP CONSTRAINT sys_tela_pkey;
       public            postgres    false    215            q           2606    16462    sys_uf sys_uf_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sys_uf
    ADD CONSTRAINT sys_uf_pkey PRIMARY KEY (iduf);
 <   ALTER TABLE ONLY public.sys_uf DROP CONSTRAINT sys_uf_pkey;
       public            postgres    false    203            y           2606    16564    sys_usuario sys_usuario_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.sys_usuario
    ADD CONSTRAINT sys_usuario_pkey PRIMARY KEY (idusuario);
 F   ALTER TABLE ONLY public.sys_usuario DROP CONSTRAINT sys_usuario_pkey;
       public            postgres    false    211            {           2606    16583 .   sys_usuario_telefone sys_usuario_telefone_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.sys_usuario_telefone
    ADD CONSTRAINT sys_usuario_telefone_pkey PRIMARY KEY (idusuario_telefone);
 X   ALTER TABLE ONLY public.sys_usuario_telefone DROP CONSTRAINT sys_usuario_telefone_pkey;
       public            postgres    false    213            �           2606    16550 &   sys_empresa sys_empresa_idmunicipio_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_empresa
    ADD CONSTRAINT sys_empresa_idmunicipio_fk FOREIGN KEY (idmunicipio) REFERENCES public.sys_municipio(idmunicipio);
 P   ALTER TABLE ONLY public.sys_empresa DROP CONSTRAINT sys_empresa_idmunicipio_fk;
       public          postgres    false    2933    207    209            �           2606    16535 #   sys_municipio sys_municipio_iduf_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_municipio
    ADD CONSTRAINT sys_municipio_iduf_fk FOREIGN KEY (iduf) REFERENCES public.sys_uf(iduf);
 M   ALTER TABLE ONLY public.sys_municipio DROP CONSTRAINT sys_municipio_iduf_fk;
       public          postgres    false    207    2929    203            �           2606    16463    sys_uf sys_uf_idpais_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.sys_uf
    ADD CONSTRAINT sys_uf_idpais_fk FOREIGN KEY (idpais) REFERENCES public.sys_pais(idpais);
 A   ALTER TABLE ONLY public.sys_uf DROP CONSTRAINT sys_uf_idpais_fk;
       public          postgres    false    2927    201    203            �           2606    16570 )   sys_usuario sys_usuario_iddepartamento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_usuario
    ADD CONSTRAINT sys_usuario_iddepartamento_fk FOREIGN KEY (iddepartamento) REFERENCES public.sys_departamento(iddepartamento);
 S   ALTER TABLE ONLY public.sys_usuario DROP CONSTRAINT sys_usuario_iddepartamento_fk;
       public          postgres    false    2931    205    211            �           2606    16565 $   sys_usuario sys_usuario_idempresa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_usuario
    ADD CONSTRAINT sys_usuario_idempresa_fk FOREIGN KEY (idempresa) REFERENCES public.sys_empresa(idempresa);
 N   ALTER TABLE ONLY public.sys_usuario DROP CONSTRAINT sys_usuario_idempresa_fk;
       public          postgres    false    2935    209    211            �           2606    16584 6   sys_usuario_telefone sys_usuario_telefone_idusuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_usuario_telefone
    ADD CONSTRAINT sys_usuario_telefone_idusuario_fk FOREIGN KEY (idusuario) REFERENCES public.sys_usuario(idusuario);
 `   ALTER TABLE ONLY public.sys_usuario_telefone DROP CONSTRAINT sys_usuario_telefone_idusuario_fk;
       public          postgres    false    211    213    2937               :   x�}��  �7좡�u�p��	�=y� �1� �=����(~�g��D��         *   x�3���L�2�t�vv�2-LC�d	�%L��+F��� "C
�         �   x�U�?O�0�g�Sx���!m�l�K=��ιVB��	�te��� <<��{�π&�{g,)��ǂ>����q
���w��'� JwCO�@fF3�
�]���ݮ�$�!(�CN���\(w��^�WJW��v~z}����־|~���F��Wp�2=�5JkK�~��3�qg	=c��Г#س�z�X�:�Au�TQ���Yۦi~ �W>�            x�t��r㸲���~�A|�OYb��+�I���ϱ���,���lD���$�J
����R�K�\|{��}|���by�}׽���<|L����7ﻘ��憷��{�HC_��bx[��aFy�[]|����i�ߗ����{s��:����xχ�i¯y)x<��������AB���U�/_��T�
s}׷��6�{�@ݞž�s����8������X��,4՗xo��p�������k���Ƣ2�G���:�������Z��<�+�v����}����������������Py~.�O�	a��{���֗?�����yg�1t��s~�@DI(aE�s8?�;0�;<�^߷�{=���I����|�O���x?��G~G���q�>���q ��徰�HJ�o��zx�N���[y�SCO���s��J�	����jg��Ñ'�r��=ԇ����3���o��堆�"!_�X��u���P_���kG����b}n���A�3�S}��8�����W���H�����^j��Ї����g����L��.�x<�:b�����|}r�z u�Q�>�>�S䂣�c�\�Y��P&�ٶc�C� fB��;���*O���X�߀���5��p?���:��+�Y��D��w=z�����|���:l뼀R��uԢ�~�K�m��_���hy��G�=��������#���6�;�q>׏vx?��m>��+k��:ٱQ�?d��1rDDR�Z5�kϻ�E1�<�E���AF#I�=��~�s^�m�">�ŧ��w��p���NXB�I���v�ϙ?�Ȍ���/���Dr���y�S��1�qP�8����[���)�5��p�X��,�Y*��:`�Mm�s�ÌC9���H��Y�
�J5�����P��7듙�tt@v�DBBd���`���=�ϗ�7��JHlW�����T��-�:��;=��''}22�T��#���A��5��t�L2��n�5*~���©����k1+ѓ�ر����6�z[��'՞?���E�lu5�S��m���Kl��p9�d�#[}9T�>=�M�#3)���Χ����2�#'1��������ĞMF����)������:�ƹ=�tā�����|= #�Az�箋fr������>ZI�M�Cf�׋�U��fґ��s����s��@fR��b����!>�2��^��`�Ձ���|�N
��>?��T�u�J����em�@vR�g�רr���y����(�/�fX���W�_+Mߣ�@�z�W��3�9�=�z���㩉l K}`;+p���4���I���>�ѷ�:�q����=���,R��8p[̠r�'2q�n�������vX�A��x�rf*����6^G�RD��Nt�3��c9. �Ja�Mg�6��ea��ld'6��ѣ����q�g���z��&Fv�Z)�a�O�*���HGNzib�ã֙�9�T���v�V��6���K���:q��~Vv�����N(��R)����>?m�a+3�=����y�3d	����uHwl9+]Ya���$kG����ʥNy����������9R6��k~���·/>ޑ�!���
�j��R�$mHl8���j$���d�\4��#sCO6�ŞN��!�C6F^j]j���(u����=�j˟Z�8G^��^����C�)&K"�&d���ކ+��j\���l�p� w�<�����z����=ǙB�N�HΓ����Z�?��p	��2�ot��J�H���~����!��[x�c��Ҟ��С
��q��@P�g���h�u��U���R(f@]����	ou�U�<s�ө����Jƒ��\Ĩ�~`���F1z��>�ŪF9�Px��EG ��	��8���V���F
`Cw��])՘ �ˇ�zD)蔡����(�:�C�ZZ��XA/X�������*$-��zg�_�9�5�9U-W+}�-��	��'��Z&PT�7�kJ�O�,��'be�a�%j�R
���xRiEk�mQa�B,�b[+��2U�VY���<��7X�EV�:�X�6
,������a�����X�F5�u��>*�O�}p�q����������	^�*B=7�
�ʢ��v�g1�����r#C@�� %;]/X��ֆ��D>�l�E��"	ᚍ@��SQy*[9���q���ɞ�pMWk��{=��r��×fO*�j�o�ǖ�H�z�%[��6o�l:Wk������,$	Ihc�2_���+��O��T����\|�nӿ�E��	��l�jza?�Kf�����蒜�E?6�@"����v.�"
6
2[�5_-^�J�p.�PZ�,e����u����d��k��&��C�����K�(��\�	��$��\�������̕[�@�����\�9g�T���[>4��X.�"���
͊��ځm��-J&ik7� .�	h�@�����*G�B��k7 �t%à�שk�����~�>OwI@7���M!����0���}�zR#�3=����,�S�tqE������G済��}2�~�	��u[]�7�^�fa�BEiڪ�v���YR�Z���3�:kr(�+�Zoj��ҫ�u��Ǻ�u��re	�>\�$�K�Z<��7-E�/Q|h��+"����i0��8����|<�ێ�p��:ɚ�"��to魾i��Ec��������У.��d?��3lENK[��-�����]�9(���L�,�m�1�j9V����!^fuG�X�
r B�������C9p��q�`��SS�J{�7�\��UA-��u=�!Wg��~�\8��]�dȑ���Sm?��*OA�s3�ޑE���>�>GG\um!��=9p�8��o�I��"��G��UB�����ǆ��cs{/B�:BNz�X�@@i�FZix��{8���G{�^�b�υ�l�w]�NV<���_�<þ�<y�?�3�݇���?�6�G���G8�ϣ�l�O$�v񪐚s�6��$�b��>D�i x�sP�ڞ;�EUP�v5s$�鮎�oᢠ��^�����F.����e���%'���+~���F��OL��D'$$C�����G���4��?��ug�đ��(��s�o�HZB-p}s9G�܄^�Tk�&D�J�be^�>���=�E>��taQRة>�����XZ�޴c V
��KjyV!=�qu\\�i�Wy�\�$��(�!�3d%z�2�w���Jb�>~������(JP���%��H��u��Ba���S�鉽�W{t������	&�6b�N���	�������Wuq��{q0p�8�W���r�_��"�t���[ߓ�Ա�Y��*=II��?�s��^��Wa]"P���t$�5`R���A
��x�u�WE��")��c5j|�LR�f�Ox����g�zk����<��>�rMT�O{���Vv��F���ә4`ݹ��5�/6gg��;k���NZ���ޚwm���H��X���@&'}���&��d�OָZ.���F�[�j�T��F��u����d%%�`_���]mQ���^N���X�:Í;'����)?��!�i7x���CT"d(z�uC�"�XG���!�6r��NUű���dg\�`��.d&{���Z���`db�w�����h�>w#�����S͒T�+l㵐�܋�*�����4����1i��yȃz�t�&mꡈ���6q��6k������Ѧ�����&�G~Dnu�ٶ*,�*d(��\$5��6nU��e�N�D"����+qk�UHː��}�m�)H��<�F����P�J��aPo�E��4�=��q�����G�P7��eI� }Z:#�~j��A�8k�]�� yZ���>_��kƂC?H�J��V�~5a�OK�>�Ok��iIjc��[7���W3��cBA
�d5�B�Fvʠ�p_����-�����خ<CIj�5�W%<A�X_�^��|}�\���Y�'(�p�V�$����*��l`�^c�xh'���Z6���{��>��*C�@]���`�L���η� �j�R�m�����+;y(d�Z���    �[���BD�c\��\� 9.��DS��5�i>��)A~U��� z2��6���"H&�PE=�F� ������R~Ͽ�=�ȑ��5�/P�m�
��w��'������8���E�]V����MT�\�d�>�8biQ)��g��I��uN��=���i�Ɏ�=�<�6�i벍�����Y�d�>���.������/)nk-��H��m��������)2w�]o�6D1"���v�m@E� �4IE1��0��uP<�#�4e��2E9ڲ2P�:/C`�":P�:/;`Q}��e�j�m��G�Z? ����i.8�HTH��B��B4P�:/c3!�l�Wl����`˽L��T��Mi��@��kmy�=�Z]�֘yճ���Y�����R�� �2}�%n�D���L�'�!?g�J�kv��~\rH��,K�;F:E�2-�
��E2e��-�rJ[j��I�;t�*�vk5�f���E��V�@����2!��Y4JSe:Ȍh�6uQv��7�K�uQv�V��FY��>�CR��R���9>���?]�a��`�öF� ����v�e|�p$�7�qS�G�~jO�䶩��Ԝ.��R=���%ycX~�kO�iQtV���k̣��"��ӥ����1b�X�$�Ԛ�մEg]ƴ6����oK���4B� jM��A��A	��`p>�U(3��e�o�Qa�޵3@A*z�Z�7��t}hM��އm�ck�m\g5j�:A�&��ܢ9���}k�n:��t}ni��[��g���y!�$�ҭX-/���B�T��R�&�n��bg�
�ƃ^��[m!���Z�q��h��U��2��Bڊ��ǌu�"���,	㢤�#��r�T`�� 6�C�� �Bo\)�FtYBw����f�H�Xx�S����r�c�y;D��l� �F�y�e��!�k|M�
9���A��/l	[S��9�R��kʟ�&���Zl�,J���.j����|!_��a�H��Y���A��O��Q�o�g�|�u��R�����(�7�C�����ыyH,""J�r{�P1�Q���Vޞ ��AC(i�t8�������gN�K�r�
��JIB���|X���>NZ�E��"�����yR9�(r˟����q���{E��<}W2^s��n��j��1$�Js�O�q�W���TV��pA�T
���O�ʁ[Q����E��"�j�������IN���t�
,�c�rX��H�h�L �:)� R�թ��Oj30R��NF�rh��H�W�Y�f�/�CĪ5����r0�-RV<���c��EXh45�{��K"cI�������ӝ#RV�Љ��q�F�
��Ǽ�a+�����<�0YN.\g�~����ЫBR�-J��8Y�������uA�*�N��"}ꀸ�W����J�"��w2Sm�CQz�����������Z��H��������4���x]�T���+$�%�a.�[��K��>����V]���A����y�~Rr�@�����̠�H���Y��?�-���,:�گ/�m���A4�C������]�#VK�&��E�,m�%RM�w����G�-RKz/sV{V]V٫o��� ��+�$m�0f1#[ǽn81��j����c1����O@�")�ټ�q+�*�{�殌���%���D�M���FcEjN��oa�{�$�?�I�;+��?�u��K�$3Af��������ܨn���9�uQ�:9
2�3Be1"A�XB�N�H��l2�ʹ���a[E�R���&�_��Ac�i�XD�,�>�;�$sʐ�5�#1$�z;,ۡ�HY��kT����|}��@��g���)M}�U�D�?!)Q��t8�[��wf�u�e=늋�6F7�R�N��Ό
��a�{e5��E#�Mk�,�E�R��0���<���rd�s�g�G|�F�e2+<��rbA�6�#��`* �I��){�(W�=�o�U���A����$ ɋs��Z�(Tk1E�m�V��)Q�V@�gP�c��#'Q��$G΍���E�H
�|97Ӑ�b�'yrv(�婳Ԭ>�Y��P���X�*
tf��VT��*�u��,�>}[�E��<8'pi�ɋ#�r�j���sљ�T����fJ^TN���E��ŪOj8Q��^� l੏'�[��t��e7�����ɔ����VP��^^����o�(t}/�����Uo���.ٚ���:���$���hW�6_5���k�FV�o�"�u0���ܔx����Nw�V8��5�����.��v�+�'��u��jb��g��'�)J�>��t_����p��l�(|a�@��P���C���g��N�DƲ<O�y��;��`R~ێ�P��,G�����~4� ����3<���A-�<O�:�FT0*k��,7��b]E�Tq��e��N�t��0n���u�7�]+�t����D��k̳�B�X�L�b�#^_� �Q�vR)�!l�n1Iry�WZ@��+�<䕌]�٨�V#g��Y�VU��}Џ�69��$��rW'��J�:_ꤡ)I�8{��ƳMI��Y[�Kd�����U�Ք$����~�g�$�1�Z5�#F�J�V�D�k�~��.!E��
�z��v��s_�e*��.�k�ӎ �!���F2K���#RgZ�[����u��J��l_��X��~Z�f�NK���e�θ�8)𢽓ǈQ�bp�Hn�wS��z���;t2�ZW��?��/J�D�:����jx�dY[�zRK�ᡓiڎ]&������/^}Щ�D1:Y_Th��R<t2� vF�R<t���{������+H{��lC�~K��*���B�p��3_x�7�JD��s��g�ciE��r�pg�A7��c{9r�ds�R�.BQ^�)k�H�5����?�خr�d�yB�1؉:<8�`�:��!����@��oۼ��9�2<8���U�\M�����d�+����i(ǃ�Y��!CN6�ɮ��}�"���Rd<��"S�\�v�*{2h����D��,�҂L�w�2�(~�����eU��n���2�K��K�J9�-���;�=e{�����<�V�dS�����Z,cJ��Q��H/��gT;5R��p����t]+�V��Z���u��Sc׿��5�XT�$�v��nCJq��SsW�c��I�l{�]��2�D��U��琁 ���T9�0�N�����;���>�LH�So�bڌ� ��~����]�O�i|���s�.��K�D�����Ͽ�y�!�y�Ž��N��CZ������B�+���閵|aq`1�����;� �T����4��d�����{Hh�h�	�1o���r�y�$d^=K=$3�:�Vk��=�2���θ���A���<�c��x�KaS���H�sj+#p��9p^M���d�QH�B�N�4��5�Nor�8��cu} .���;���W3����.�mu5("#�젭z��rj�<$����C�0}T�K'��g��\�KZL,��7��J�K�,}d���=�c"��=��?F�[}d���!p�F`d�}$�l=|r��Ol�OdD�i�D���=i�jk>N�6�T^U���Z�(�ڽ�Vp��Ja����f�>��qBX��ߐXB���a�4 l���I0d�;��!ZC��ea߳�!YSG��`�Co�x"�ߥ����C3}�v�l��ӹ��g���/�Ǉ�jr�׭��o{5���t���b�n���_߳��s]�����N<��͈>��ы��dP��J��ͽ٫�ݿu�Tأ���V���0��ZW���kF���M����]N*�I�[�k�-���Vu�4N��Y �կ�^G�����ΐ�L���	��� ?�/�)�������>�jl���1�s�~Z�Y?���Y��K�j��^�i�[?#
��g��Dy?���Y�6�l�H�c��J_��L$G&X�z8��d$�V��N;�ܗNX@_�{����h��#9vD�/$"���FG	�P�V��)Qٛ�v>�/d#�N�d������`���Г8L,7V@��b�'{Ӎ�6��j�Z�ǘY?���ejw�(���*ѱ�}G�H���    F7=����lr�ն�a:H8�4���i�:Cn��E�ByTۡ�ol̹N"�ɓ� R`q�ٱ�}�Y�SF*;���l�v���NM�m�ߖ�٩��]�a|i��#�ъ�1���@vl���~��pl~�l旔DvY���_����7���CAˎD�@"�V�~�dGFrd��E�g��ˉ�>��ͣ������'[�ݏK
f����P��� �ӗ6Q�����`�]C����~M��k�0U^�S��j)���� KC����G�%�28�r9p���$c�$�2��O�C ���,8�K��"�7��s�E�%��ة��,}��CR�᥵g��C�V�W�L`�P0d0���6Yjp�ۀ-LÖ%�®��Ͷ}��q�H�Ơd	BD����,'ؙ�廓���</�#F�ϑ.,���\�gm�������َPfiÒ��Y�Y���l��*g�Kfo<�yF������%Ka���MV���w,����=��-ܯӔ��]����+�6���ވ:���h�'�Gk��])"Ͷ��0�e�58�j��Ra�Q�sD���BHs�ml��s����Q�-�m��E�l����{K6F\L�:�������$j5L��1̃ʟ���BD�2����U�(k9%"���ŵz4	P����Bg�E�7���՚0S-��|dV�L��x�_�C5E#���
*i�p2.���E��K���bΗ�E�l�6h��Yy��q�EA�������{�����|/c�KU���35#����Zc��#��#k���A$��)�ܼ�t�[HH��D쳷z���b;)+��VKm��&¡ɏ唹��d�LD��I�:!��u�k2�%e&3k��<o����h7bi��?jLGV�3�{��VO�#�eI��W��y�s�)-k!�sD`��%jK�S�h+YN�l	���SQW�S��ODk�JKS��Β��"5^�e�0�\��Lͺ�Ƣ�����X�Q�LK1ֽ0�=s願���p���*g{�L����3hLj����.0��&:L�-��ґ"5�W���M!���a9MJ��Cx�$c�q�=�6V��U�ݼ��2^I]*��na1l �qK�[%8�p�S�b����*?�W���^��'���������bÁ�%-Q�*:�W��Z�d����}8����D(���u��!�1���kr�}���Hs������2v�a��axǮ+�B*�w�dW=Fē�v��{��n}p��[�:�Q��=�b���G5���1}ˀԖ-T�#�d��(];k>x�ƌ-ÏSr��<�o�N�7�{8�:Z>:/�
�fۊ|��e?���YP��ǹ���?�iުi�lj��<���e�s*Nh��8�x�EA-Di3�_ u��2humٟ��$����~	c��A�N�B��T��!�
�HO��\zC����r�c��L�i Q��3_{L��r�J"��D0�|� B�e�A���L3 p{�ֵ�{K��I5C�VUҷ~�ԣ����	�,lj��Yej�e,7b$�)3 B��-_c,}G�'|�XN�NP�)1�/�R���T�����9���/r�pLzK=$1��	�b�/�DQ�O�hKe�Lb&�X�$$"�M�f`�GĤ�D��s�U�q��#)L3T�|�z��X�.� 3���ߓ&�ޚÎד	���3C�U��� ��=`��a���㵪��c��*	\0wt}%<z��,1¸2�����-d��w�*p}	�s���^,��V���
���%4�e���,w��.��͜�C}��>� ��,{g�����7�c�R2����H2�d��ᭅ9�ԑ�y[��B^���xAx��,�
�0\G3���Ү�t��,���dSF.*MKϠA�(u�-(�¾�u��1_k�%0��9[��-pc�:81�{�V�#w����41T��t6�j���)�0��MmU���v�Z~���U���-w���V�y�*��r�_A�/	zи(�u��*�5k1�S�r8Q������$&��V�M{7�PD���\p+���X�یZ�r��;y]0����\FD�a>,-3�uVD�E�E������t!i\斷]^	�O���~oi�6J}C:��q�*#-i⪴��0�O���K��R����"�uY��q[��H�d�+�B]�L���򕥟����._��^��x�/�(�7My�:#�!;k�x*=��ő��.7;U)�R�B��E���#\���h������ZyM�S	ຬh#�2�lݩ8���X�ĥ����¬�e�JVE��|���1�R�E\������p �Ig q&P4y�ĕY�|4�R�x�TB����zVz��7��˸��5�yr�'U\Õ-WM��yl���{�����j��]��ˑ�:�vYO�b$K؏��A�HQL��K���:���r[Td	�(�� K���&!�J�J�C�:A�nCl�)A�?��l?-�j���;�VY�[+=�W����օ�����'�W�x��m�`T���$Q���:
#yK��F�S�HҒ7��Teb9�J���V؇C�RU�4p�I��M�㟶']b/ ����s���ft���>�����b�J�D�5_�a�ʾ���Q���Xcl)"4 �8�s�<�Q��F�|_.�]8���^�
RpL�屍F:�)��&l�
�9��.O�)�Q��>�k�"a}���!����{�es�D~��w;.�� 1��nS�mo��$�/����~��IHv|��4�2��Jг��o^���H���',fw%%9�Z��2d\�$#�� �N.r���{$6]P��
/���~��䞭�u��*H��$���cmx&)���+��K�2�:~3���r��Ѷ�U%����Ȭ����I����χ�u�ʐ����,W}&3C�V=^2)2������;����H�P������X���p7���]�w��@prX$A*q�*�[J�"y\����vM*�DN��?+	Z�L.=SW�U�k�J.��y�&(��e��fF�~>8���,��w-��ܪT��K����G ;UˑB��L-��*|��F���rJ�v���_le��l��Y�9zz��Aŋ+�c�'���@�R�o�ޢ�I�L ��M8�:���ѽ�b͉�#�1�g[����U��C�;G�^�al�`j����-�,O�z��ث�,�R�xl��=���+���N�y��H�@��ʯC;w�/F@3���R)wT�����J U-r��!Еm<����8���6:+���2 ��~��Nu���� X 倠i�Xοu@�V"^�(O��%^%�r�f��� �@�}��k75,6o��uq� Q��Bk"�΋�B��S���Y!r4�^^V�����چ�qUa�#����d&hF��͓T�4�^�6�*@6�f�v���s�+vcr����Np�ԣ���Lo���<Mz;�؊e����pAE����P!q6���v���������48kny�]�7��m�:�,���1/g�+F��?o泂�0jF�	�v�I���]���o�[�T�d��ݛP�"��@'��񅒡�]h��`��"��Q`��&ͪ���'���2��ٍ"IFCA��X�8W�� <�$GI~�WOE����i��yH����T�Q�"�`�`��HR�S���p����X��=�P�2x��A+o� �������
�7���q2��X�K��#��`�v}��*� �}����D��-r�D�c;aj�}U�\��u�l-�����Z3������y
����k+�o��}������V��CW�]-�GIS�����\d��B�=T�ȯ�l;RBIP�;b=�R�"����"C�|�����E�[!qdq!vq)�N ��B)r�!g�ECB?S������8 lC�R9o�L��o=�.2ܠ�|�@��7��7U]�"l(�p��� s�i��__WH�h�~_>p�>�/�A�$y=����
yl:������AA�    6e��#�/��*Q/�ү����n�*�G�����U��z�P2Xb��:���G�qE�8/��Ӧ	�u
j�A��e����(��'��x��g5q��9~��QS�#P��<ƺ�#�z�?���z/��/�)J������8�u�������?�VT�@��Q_�����b�����vMCG	g��R���M�Q�VI�;��b�G9�OCM����E�0�
�-v��z/�K�@���_�p(�P��9q<=�V��x�MD��d����V\�9ȇXPQ�_�"F ��v�v��a���>�_�ˋVD����sbS��Ni�k�G89t2O�����eW\_�
�i?���+�lU���vq�+�d�0�J�����A~�A縆�6�D�jB����Q�u�3d�sRf���şV��+�M��j�V.�2�ǥ�*8�E�,n-�����c`G�>��˞�s^t�#�ɺ	&(�^:��8 ;2��'#^�[�v������|C�)�����N7g�.S��n��`��� - �2�:�F�8u�Q��mC���g���	İN$ƴ�t�a�yv�����'4�~DR5�ֽ�r��]�WM\�WMf�ѥ@�k�	�p]K�n^ͽ�p�q\���B��&vy�w������3�����݁E2���K�q�� n����?��F�r�����Fq�Ű�i~�5}Q<b5,�b��5�BT���pʝ}��2F�$��k9��":�CF$�Y��K䁧���5c�~����2�H[<?��$R�S����y����D&x�Z5��;�
�G����|�'����v�~|�$�p�*��5 XKQd��y�̔%V4?���^|a��V?����%��X)�����EF9\_FG�}�uoR`�ѵ��������FUMC���'oE�fb�>-�L��W�}Y��D���hsPO�x��A��� ���{�@"u�E�O|\t�#n9#��lC�3��}}�:��'ąg��o��?�l>͢*�� �.�EN���m��)YD���ӽ�3!"���8�^����VN��uB���7m�E��Y����pE���\�ewk�@�xl��͠$���ഁ������x�e|����Z3��>��d?F���U�z���^���L�>�i/���� g�g	�yz#Eˉ�p��d�C{|D�K�1��p��Su�}��&u�/H���xl��E��4I�^��nF:h8#��N�� ���xB��w�s��ZHQ�ğ��ʍ�UE,�#OFG��(�}��z������T�N^p���>`�O���jMVo��^jU$��黭'Z���:�gi�P��S��-?x�\s�����+�Eo1>jD}��V����w��B���E����������g�թ��c�����zq�w�\>�+���9�%m��u�2j�O1<��d|w����2k,9�x�jj.��\�8��"0/u�cQ݉|�����A��f{y�܊�5��&ou�_Q��r��n����y�����]��x�����'�N�fo��?L/8�N�z򙂸�.�J]`(qa|����y�b�*�F��W�xj��7�^	/�C%��*u���=p 2;�W�8���]&�x1\�b���:�mm�����'@��6�8��l����	����թ�Im�J��8�O5�Ē�A�x4j���|q�>�,6��r�Ot�RZ�f��zY-Cb�֪[^#�I�s%�5v�^+ܑL�v�}g��w�1؟o�J{��`Ǒ.�>hI��O�&b~M�켖=.?a5����E��=Έ�Ŷ=F�����q{�U -��^��>v��m��k��'}G�
���5F����v���%w����F�K9��}3�;��������V}���\��釮U�$��|m6GK���s��	�?5L���c���EH�"��a^;�#�k8i�g�
^+�����A-�2$���˾�I��$3���]K�*ֹv�fU��_�o��k������R�,�I��k��{�ܶQ։D�����M�~���8Ƀ���㼖$�hH��X�_�Đ�Z��H�5��[�u1��rd��8���hM˲鼖$��V|wm���d�"��6�jM2xq�����Ѷ�V'C0��8�}e�ka2Dck�O;����%>���y-K�d4�S�?�?%]CoTnIE�עd��d��N�q4��3 b�X+���:'�/	ҝ�R���l4?�=66��J��=L+��Ċ�u^+dU�Q�ky��jZ� /�j����\A��u8���C2���G��k�R�^�Ů��s^��%�*���@)I���
�I��"*O￰�|�L�%J����=N������5�y-QJ�y����<_����]��2t��ڣ,��F�K�
�6�7�e"u�Xh(?P��r�j��L׽I��m+���6y�C^����Zym�%�����&�<�x�5"
k��۟y�y(��?G����0G�oc~���u~�����I��x�������o%��öC�[U�S�ebs��z?����+S)<9���L$�U�����k�Ӷ�pBP��xt�U|y��狪UI�gsȳ�8��?j=槖k���i?�<��#S���]�}lbµt��T+u��`�tq���wa���ȹ�[o���KQ�3�E&B�����+���V�M;H:�G��D�~TEnY�{8ګ��['B��(1lK��^���ku=�/1���[���z^_��ml�bBlmN;&��K�sx}���'��Gӵ���Vm�n�9��b�xO!jj��j�����+D�+l�o��L�jǮ�=xq!��lJ\���vAV��+QG��}����5����*�8?g\Oa�����.�7��	+�b��p����2�^5<��T'��||�e����>C읩�>���;^e��2u"d�3��1�������9�|� Eބ�r�U�>�0�S�v�os�.C�ivZ=C���o��fJ�Nh������4��s����e�s�w.^s�i@��9@��o�)�A���+mK�s��� ⸞��A��7���ő�qNI���v��L�딢���>�*8V��e֣`1��)UAC���Ix ι�p�X	s�8Ku`?��0"���}�D����6�,0"g��c� 9% 8�Bxx͘S�ӭ�����1�B�~�e<$�qYbr��*����r�419�������H�/�^�ZOޘQ ��0�&���� ~Ŏ�v���^��t���*m�������u���������:�D�n("_��u�H��^���l�?��L6y��*�M��H�X3�-%�Õ����W:p-e(Y��:7đ��������,"�d�� ���P�� Xr:�O���^�AH��\u&�����tʟȅ�	���V��_v����FB�3H���O���0��:����>��	�9&�s� �S�p�#��A�ё�zg]TM{�hI�X��E��K������m��ɚ� V��_O���3h������Tv�-�jА�<,��?�SeE㾥��%�r��Uۮ��ק�5&@-y�|	dJ֙�+y��`Rcy��������Xہ���Ϊ�2�\�2�4���E)d2 �_�3�;�߯��zBE�}9��'R�r2�$�D>���EkN��Q���U����n%o�q:4���26�L��<��qjwZsf&�	�X(ߧ�Gb�r���2ѿ]�-������ܑ��<�A�� ���N�^�s� Z� t�c>���CE=�:ج��$�ӝ�� W\'��.Bw�ҕ���ڽjk P�|@M�ia��&�ڻ:��=tPׯU���?��D��C<�#ဋ(�.�_�3���$���n�_��8�K���z�a]�SN�K�|������V�Ze1���*�~y���n�䟆��g�m�&�O����\^ɟ�[�E�1.�w�[�v�<.V�l=f���N5����L i�m���C��~ap�J\1#fEU��h��֖ .�>��u    �Cd�L.�Ұ]��`k�Fo�����ß�{l��8
�JvFa�PV�d���_�7\q	��)UL�OI��.�+�J�n�K/	��ݴ�0���(�t�|�[|�����D֧��꧓�ew��U��W�QU�bt���S���i��h�]g����
4Yk͐;uLx?�� ��:_i�;�)�I���Gl�h�Չl�[�@D��Uɩ����
*&?��,j�|���noE� �לˌ:��:j���(�ϵ��&�!r/���"!�V9�f�?v7ck!��l�C��1wQK���*��?�/����P7�q�p�+�*(�V����^%�M�Z^�,���N.jy���b5v�����EF���"̷/��E����b�,���Q��<�ܾ\��2����p�Z��,�f����G��*�,<�z�=HM���h������E��3ð���#9v��.��d^ˑ��C�smm��H�d��e���E�Kr�  G�)3P��x����H�P�	iG
�!���sm{?�N�Z������2�D�ܿ�n�Һdp��zXV�#�E�ۼ�u�4�.W�"J	\Ԓd�B�_j�����'C�3Dn���5ʐ4l�-�-jq��>���ʒe����G-[�^��N�>P$Ơ��r��8DK<���V�(%�G�p;�{@�Г�\Wm͍�?�Q�{q��Pr�af��u	qti��m�7�&��RK����f�`�������ӡ�?p-(@D ���2��9��,y���_���.�@� ��NSȖ�����t�!�u�h�]��@'0�揺r��-"x}s���	�j!n�Ĭ���o?t/��:9-��� ��ّ�ȥ�>�u�]'ǣ7o��[y5R��������<^_E� ��]�Nɑ��Ԕ�|�lWc9�J,eê���vM��]���V�G�!�jt���W����J�"Q�s�ۿ����y�p�(���z���}�_����q�(�%q�	��0n�E�]xo?_���|��"S�%4�w�>�=�^D�0�0�oɐ\�~u��/��$+:�����Jļ�Hq{{O�bP�x��xQ�=��Q=��$�Uh� ,��EkCÓ�ثa�S��/����(dT���.4h`|m�HT,�M��@^Z��x�N/��c�	�ӫ�6��k~�Z�����Zs��6��j����x{�S�v�!E�HT_� �z��	�����`�ǽ�W�"�H��h�J��AO���u4|�X���HVz��U��iוcP�\/�����9��p��ꐹ>�ڪ�r셥a�lq��@E�&��9_FC�\ߋ.��מ�\_�ѵ��,�ek�O"��镰����m���@%����vdA�����e֕��-��Q���v�?`�j��U%�9i�F4��^ 	ф���w�I
3.ma�]&��R��PmP���������P@Yt=���k:��K$3��Kn����z�oЋ=$����]C����@�`�e1S�+A�8���jݡ'MCM<�� KCI�5��6{��-pתbaMWə}7K"q�35�Z��\�ܞ��&,�d$F���Y!�'�S'd96ˏ����Wx�*�����2�8_nv�0�Ń3&����48SX�2]ZL�ڇ���4V���S�߭y���5&�'CȍB��)�����Uj&?� 2�h �@o_d 7c��˻�	&A���k�8F��I$8CD_��8�`'xqh�6��8#�z�@���6ޏ���ݟ��$��̸��j��7-�
�J��.4H}d E��U��sVϵ��J2lI�-%&r@����)(����"���.�Kj1�R��Y�ņ�FP^bl�oE��R7�gʲ֠�hLΤ�<ø�hR�`��b����+��Xص�S�Uh�!pqhp&.7�Ŀ4k��LF݆8	 w���̠������"_R��m�Bp�&p)�NB�.8ӆ����4���
�!E��BDM��ku��dE����L���L��8VQ�[���������g��IV\,��A �Ss��fQB�ə���|H�	^ۓH��b���k��3q�hp&+�8�!dBj�"���k��;���dc��7�P���I�T#���F\-��F ������H�u)����64h'�p�hp&öC�=Z�W�9�!(/5ZR&�q�hp�'�.�l��g�1��y�j�l��/�#>��dI�1��0��@�zgm�܃��Ի�ɛt%�׼��gZ�*l�.9�O�i>�[�n(���ec�bz�@�z�Yi�9�pG)uz�p�s#b���gO�����u�I����48��@-,���j#k��[C#+R�ᯫ)�.΄&���R!l�G#�iUڠ��ER30 �T�J����#-����T�ѻ3��u���'�1���#�fC�ȟ��Z�v��������T��x�댉dJ
}T��h(�\�®Gw�����W`��skl
�g���5ȩ�&j�O]?g�\"�����8�iJ&��Hz�W�8\R)�V#	�9w~��F憾�U�Y��uFfA1D���ß݈��_�?$"l��;\�E/J�*̹͡�<.U��+���$0��E��]/i^��E7���*њI�O���K��\s;�Z��yI]���]�%�ˠ��2<�^2��"qW;��#H��,>_Ao�C�]���p��J⯨W��c����|G�{l���g�Y����S�C�z_����b��2bΧ���@l��s�:eiH���M�S��v����ZǤ�W`��)�1�{o�}��L���I�*ݹ���N�#ε�1zl��)���p���u�Lg��ڭ��Dw.�m� o,1ED��\X���#�=e�si�!g����:ݹ~#;�H^j8�r�}�VQ�# 95PL15�.�����Vk앙QeAɚr}�Р5�yך�.rz�q��A���f�^�ך�mO0S�#�oغ-���kkM�U����fJqD���L��A����a6?רd����x�bih}�ⳅ�N4���n����2�9��ƅ��2�9N�V�:�2�9"��;ٟQ�#�:���|�?#A!6v�\�*�ֺ;-�a�&��eU�+�.S�#�څ���sI�R��s����2U:B�J��C�&<U"9�[�Jʹf�uD9���M3E;bw��_�a�T�N	/5^<��J�����Fn��G0�[+��'2u=��%W�q�� �q�#�{��e*yl�6ƾ���.L5��a�&"W��؛�L=��)�: G�J;4��G����p���j'L%S�×Q�˦����������}�gR��1l�z._���p��< Q)5"��;J]���R4�Ӓ�/S��!����`[��*�t�QT�_���e
{8�!Z�d
z,w��3�WA��T�H^�|���LY�%�����&g*z���s�)Ky�����`�c�2�;�u� ;i4�`u�t�|LV��&t�z�I����8�V�DPG�϶����1���O<��:�3;�CiU��u�P�cbT3�W�;Ī��d�ɿ��{�Ԕ������謫G9S�c�����fJz������>U�b�Z��d�Ք!���l3�J�s��U���G�����:/a��z���/n�G����;�"<��Ed�o��[��*U��k]��w�<Q��%y�qT�H�����������.��WrE.��ae�12d�o~�6��pC\�\���e��@��F�ZW;���
@��F�����!���ÍY5���T�g��8����e
~�U��]��'���Kךts�f���Z��z����[���g��%�v"C5�����Nm���N�Ѯ�C7b��Z�J�Y�[i%P�������hIP��h����=���VRtE�Zױ�KZ��B))��_-�4s� y�x�Z�Z(��z�z5��P��_iFr^�O�Ϣ��,\@ q�(D�Թ�-�|��(ޗb6�K�5�kW��ϸl�]���.���n���#kX���w�2ޗ�.z#s��f���izx_3���l��ַ֛��݂��6�su�����l�n�+��    U��0�l9����	����f�x�U��(��k	��h��nE0p9�u�����L9����l.#�3�����]���)8�;ۯ�)gv��e��~��93��){R���V��ɧ����=��!��]�]��d?/����&�y�/�gF/�@μ��vE,.��e��)Z����AF+�/ƁM�azْ�U�@Sj�cw���U��,����]�@S\��og��t8��1�v`�����ح�w���տ�Id�b���y�/N��pGN�o�?���_�#��Za�
m�H3�x���}\�}.0|0yj�l�x0���<<"��!g���z;�^��k������j ���'��1P+��ZÇ���?�o��Յ�u��H��><���_�(9��sTZ���+����H�vW�Z?�]S	�F%l��_s����Hc��`��~�Ň�fr/n/F#�7>.8��� ��fp��g����.�խ06��gI[4�	Y���/-J�w�D�QUgy\��h6w�,�%��M��gdm�.���.G|4k��c;W�ai��	�"n�;� ��\r�>������z�%>�gn��>�b�K�v�uhŤ-�C���=��>��#�����$c;o�{���H/�J����HS��͈��8�a�	}p�X�̳~�&�y�0�����{p O~pFĢ�y�0��Q{� �h����^C���i/D�zs�m7m14s����6��7�%&|��%���ն���@��ń��ݶK��`�RUH\o����x�#�����+q9�{��Pz]6?nJr�ۉ��H��hF�7�E�V��n�����p��wݑm/7K�S�;��ZE���p��Q�#��}T���R�gs�U���c����D՗S���-Ā$�����:\Ex5�`]�_~6	�ED��52�"63!�E�9�T��D�9-7�c.Eސf/1�s)�=VVѻ��c��O�}_�y��1��'2���k?�G��0r��s&�f6}#-�!�챝0�8�����yIK��|�:a�j,� �)��nBH�`�D"���������s��g���?X�k�t�`���e:�����sڹqKa?H�������c��%��kmc*j����Ŷ�~����#'�v���r������&���Y����(M&��~��$O*w*�М>x��r��b�L��HD�-& 6F�4}����<�凣�P�#�ou����
u|@�01���uf3x�T�@���g_��k�2^�m=�P���l���ZI�^�k?L�y{���|��/I�^u�t�c紦�)���V�`���8�c�G�w��8Qd&��1f5��n�م
=8��@��t���.N�鲴@�BqN�-��ZNZ�Y̝/�P��������tka
Uxpf��2��@���鯎@��YD�5)��3['��/2���i��ތXŰ��~��;x3?��o&Ȯ;��#+��Ϊ�R[o� !���BY|Z�Ɖ�45���~m߅]��J�����˖��PZo���_\��;x3�7�/��Э��P�BE�[�\'}n������t�PO��F����C�k{o��F"tim�m<���
���������ڲg��"�B�\������-5t��OZ��b��}G��T͸%К��*�]k�b���r������utR#��L�.�P%����`�J�b3�Z_�|D3_������vwK�Nь�H����TDA
��8D3(ߞFM��ҝ0i�O1��읰�멀ky��\n��>3�oH�����G�"�ߪ")5�d��Z��.��K���|��T.�U���OB�[�-���P�d�,D+�6$�(1��mf�b��W/!�%�sZVU�1�<�M�*\�q3,��Pۆ�WX�X������T��sU�KJ�Л���9Men��eΠw[h�)�͟����Ի���8ֻ��癒�֔�d�����/	�Bsi���R����Z�kY/u)�3����?�f�A����k�e�(��3wv��Qb�hO��ks�^�qH74�j�(|C6�U]������7d�8���k�U�����Z!|�z�*���~÷�B�y�~\ [(�C6��=|�U��C6�Y{�]^�BE�9�·�����!���R�Q截�ͅ�È��ׁ�j�:�\{������7��(�5+ ��t�2+=�d�嗀k)��x�Iw�7��
9曲+v��R �u���˼������Tg���Y�O���vP���Ud�����^Y$�
@n�������7l]�N
y0RK#�̸�F��ufv]�I��B$�FL�'���AcM��؆х׆r�cy���:.�t9`���[�w���˶\ Z�ߑ�b�EK��;)�bE���e�!�!"Ԍ�裸��a7b�o,�\l��=X�^�;i�EUAL�q���r����w�Z�'�f�����n�\�Gĵ���QH�JC��M�{��n�o�Wʩ��l�x����n=��9v�рcQ�T�;��j֦�v�O����x�?fsn��*�VHF�s����t]t4���[4}�Vn\2�*F�P0�]j\>#b}<�'��Zo}ǡM����N�X�#�>��\��
7���u���k5tt���T��A�o�S��u(��3ӌ���
k�QEGgVI��ߐ"g�X;ՠî��F)����؇���Ό�e|P�"1�%{w��Ɋ3SYѓ�-<�f��3܇����":z3��q@�a�QGGo6�b�}}G]���Cy���7�33u�Ǔ��oƵ�_��4x3�u^���F.�s�f0/��@�w��W����]��h�*�Û��y��6{�c6��)�wT�1�!hA��������<j�
�S���U�;��|��m����]�+���G���!�nנ���r4�Y�|*�R�g�����$2�Ȼ�噃���cȍA�e�˪ ͦ]��eֲlf)o5X���5���w�16����+A �� �ьص.�n�|�Ex�f��uQ�� ^�FDs����*�I�m� w�f⮘$�Qp�h&N)ҮzG*���]��|�I\�@-��Ӛ�A�2�t�y+�X1�Gpl'N�l*��d�!f-�i��J���nEo��v�1���zj��J;&s��b��1^m:�܎��aJ�d��k����Ge���NO��y̘���S��v��gSu�z+���a���ɜo��Ь3�vd;q���t�`g�9��c�ܨ)b�|t������X3�\��_<����:�7����;
�ZEb��k$����6U�Mڌ�:�f>>^Q����*��y���R��"fN>b-�?m@s�ܒ�o��k-���[��*������%�� �v^�v��K��C�|���+$�߉q`VN�zs��o�D)^�X��M��P�rʹ(��s"�<�7���P{��Z�^��Q}�i�p�k���;f���ÿG��G�]dj{#��ck��0��5�*<f�����;J�sk���Q��l^>�ߓ*G!sj�=p��E9��dI�璌�gk�����k�w�k�'�o�N�{���ҡ�Z"')>���˙�=O:i㝴�W�sz�T��Q��R4���6�"�Iy�/T��&F�������
屮�ln"�90�������w�Ax'�=��q�׸�$��m"���F��w��L
HVl�-���Ë�7��.�;)�b;NJ�b�}�'=^b#����M�N����as�nm"}c��/%�Kn-���O�T��Ŷ����Xr�����!��.��"^?H1�j�-��;��:2���A�:��q�F�6��m�yGY^�t���sZȚw��u�3zZ=Ej�+�*�zf��z��`�Q���,�±�d!�s�lws	+����(����H��-\/��>���z�g���A�f؄,6MR��>�&)%zr��u���<9�(ZS%xG]�\�VZ_�ĸf��v��<�f����� �-�*t��P{'׬�|ܢ����N��� Z4��    yG�\�K��BȋoVg��FF	�|3W���<qV4�J�ߓ	jG	���+�pn6�C5�|3j���Q�'�̚n�t�w��7�6�ա O�Y��b<��(O��;�m�R�'߬]���� ���3W�w�jv�[צ�i����e��)4k���e� =��)4�����β�4��U���cz>����U=2����͕; �^�j뾜V5=��5{U�j�?�]��6�4���.��� n�S�-��Oj��K��!�Y AyN�����" P*��z�h���n{
6�>9,c�.{,ԫ(f4�IG�
/�qֱ��mJ�_���ȳ�H��ۣ�	�6YL���xG�<E���yj6F�?O�f��*� ��7o�6��DӇO�ڦv1�.��dE��MEk	`��dw"WѦ��9�]�_�l������=�H��K+��W�H[�5������V�������
�⪣�BA�b���Ҽ	��1�c���;Oi��S��骧dkf4b���߅�%[9����1�l�l+�n{���w�ĕ-)��m���qO��〧�f[\�*kOoE�f[K�^�z|�黧�V�pn�BSOϽ!�<z��7��A����l�n����΅xO�=Ͷ�� ��{��i������Đ��5`t�<=�4�������yO��5�(�N��oO��n�n���eAn�-����c�ko�x��c�f��7�\��p_�{z�)�r�_�����zt���j�c#��oV
��V#%��S�E�}ml����^�0 �ԛ
��T�O���{�Q(��d���ݯ�`���$O��kl=�G5�-���j[z���U��aA�������}�b��A*nl!3Dگ��AB*~�s3{X:Nv����#�<�(�"�8�^7c:����W����n9f{x���Y����F<c�T�H]/�Ȥ��:��m4�"��cK��?=ڍB��bk�2���{	W#��~�R��Z �~��o���4�aK^(vjS��2 ��7���$����>��r��"�T��r�4(B)u��kmn[�^�J�)<Y�V^aK�����	ٙ��vO|�y�t��+��u���"�kI$�� ����W��u�a�Ӧ��v��(��<Y��8�<���<ˈ�E0[��l:YfZ���v�[����Z����δg�y�j���_�m��oˈ�}'��������o�v���/����О�V�C�ܶ
�3�j~uo~�C�o؜��Z�7>WeoO�TVY:�^���0{�`8��6��	'�3
�ݔ�n��n���ٹi3�g(��u�{���P���ӯ1@�]�?�츃��f;�O�*9-K�R'��H�fIo��7�eڍ;de���qe�m�=��孕�c����}��ô����K��㴳z���Oik�'�͟e�7�ik��t����m��~�[�_�����o�0��>���ٗ��h|�RE~��<��׭+�l�C��~��B��{���=C�ه�/�s�܌!3�M�-.�0q�qkx�i��r��Z�g�8�4=����z42�zھ�.�;�a�)��0�?z�&�?O�o�]�קU*�V�}��H��ج3T�D:�7+& B$�J2S�fq�D��lD���mN*\ΚL�D��%������Cփ�XF�06��|�c;K�d[�	A����z*�ơs�#�2�!&�p�sHSy��ճ�}`0:�y� n���� F�s��'q�<�)d0�e���(��C�9��C^�Z����@u�nc��SL`�ڂ΍�My=m���9��)��!�s?W���M*�1������r@��P5-|`0۬��Ok����!n�������Hzcg7���(x���;�5�00 �cޚcg8~u^�R��`g�؃W���_j,���g��ov�yA�%��w����4m��n�����yNnk�{kd�.�R�>0Z�S�h��Իg�<��I�4�Ϛ#�)u&�4�&bP�le{������A��u#"��?PI��3�m���]����1�l����[�!�@[t�X��oŝ��w~�/��E�-�w���P�`<��#�y��U��[�@`�;϶:?�r�\&�s������&,��w��w�m����!�J��s�]�c>0���Թ�����������������v�my�L�/w����s�^�=�Z�>0��g[�W��<��Ĩ�+�T�_��|`4���8�D.�[IR���w���M��d�3utUc��1�mݞ����[��z��)7�"A�,g��k�u`D:g[ǿA��)��@tζ|��\����?�l+���i�\�X�Œ���/�S� ��bk���ryY0���b�qL�j{eA1c�����A�����,�������������*~sl�����;�w��w�����ߏ��i�~ヂ�b���o6B�N��x�f\�5����z���u����WVg1l&��=D���Q�P���;�̞�U�'n��K�5�Rmc��,e�nP�V-���y�[
̪m�
��$��>��]mc���j����}]�I@�U��?��^6�ٞ/ˇl)zA�V�}�ީ[�2v��"�aV��]�^������w����)��^�dx �>P��=>���AO շ�2�i:i�S/O뭁AN�g"�3]}�`p� ��j�B��6���UQ`��[�I�ba֗j�R��jP���6I�ny��Nd�R��D@�D�͟�h��[�I��I���Ȑ%;�,�L%�u|�(3�N��w�^GƪP�t��&{ΦV�ہ@��l�奾I�nsE"�ٜ��s7+c�:.m�e��"���l��Zց(2����ϯ�-1DQ�AFv65�`������U�6�D'�l�<|R��D�6~a�eh�-]02���f��Yއ�P>2���&��kA��v:<p�?2hN����o�D������$Df���E�fZX�LO�\T!E#��?v9�rԯA�FN�V��C�Q�,��t�@j��D��c��K�O �쨁���?L&�O$B��5/
IwȀ�����
�d}���u~q��`19�a'T��������@r��4��>C��k/0 p��^����`�I�S������O!dC}�K���C�=~[ӛ9L�zrv��7" `�Ԩɠ���b��0&��6�����:�0���*}�` �Q�JH#�C���O5_l�ܣx�b��z�u��A��C���ś�c�����J�������<^�W��H���])y��� �T̿N�_F�&å��4���َ�� $/@2�<����D��}GV�z�Ā�ڬW�Fv�`r�����'�O�H�Oj��>����I ��d펐(�EԮ4��x�FI�C������lfq�h��c?D���8i��ql��\��*�=Ab�S2о�Y|�i�n}pS(*� z�z�v� 3L0�Y�£*So�4��0��~���y9�{Q��8���2�}�*�Q;0ReSًX�ǎ�LւS�xooh�X&_��/XՒl��+8	zIuD�Z
&o!�O`o�ܧaQX�/������3����oச1a ����y)����jׇ,D�T�h3��g�ET�:��*#���q���(�'N��Ԝ��l�d��=$�i���|�s�@R�d`�#�|����^,b��޵��D�&m /d(F1t�(�M�%�ް��R��R�P;�C$p�>�lȨ$(΢�|y]�B�(����*V��0\^l�G(��2��v~L�x���G�*ZX�+�Y����_�X���hiQ0�J��%�Jh�ظP�������~5a�`h���������3�-������b�h�R��H7����pc	�b�����2�A	�R���g]���]_5e�1�-���r��vP��W���oI��3�5���<�0wE�^:*ƒ<�O0��1�NT�jq�'��rY��,h?[^��D���?|�`�~ˉ���W������=��aQ�u2�$@�T}�ʁe*��di��r��^��C-�S�}6�`j�j��y�q����$g|���5'���r��\��׀��-��HY�"��Ǯ    �����A�H׹2�%���s�F���A�|C���&y�sP3���������`ד�Vg)�K��JV�������v�p�[�IhB�V������%9��<տl�;ʫ��:Ð?2N�I��\4�Ъ�r��!�C�3����iZy�q?<�'�zv�I�iP5���o�W���fY���� 쟛�g?�����I1B���t�����\�X�B��Ч䁕RE9���=���)t����_�f�e���FL}�Q@��T�V�?�Ƙ{;��~��lVj�<����B�;hI1FΚv�s�e䢑d���F���I�D����G�M�IaD� ��8�o+�Ȩ^���*�O
"ʤƿ_Ϋ�D�I�z�}fL
!ʤ1��&P����@�v:)�(N��U۞ID�)��0�q�6��>��!�
ū�}-�F�"���_�_O
J�Gj�t�� �D�=��_k1��j	^�4|����V1��r^��`6d�=WC"���5RŞ+a��aH{.z�]g�z��m�^-" Dg�A�7�"�Ɛ�Q�	<�M��~R(I�#���z�k�\1���T9<��=�T*1x��j�,v8��?Cr�d����aE�s9Dp=Z���)�י"qX�<�^=�L6ђI�����Me�����X��B.\MX���.�Z�'Ok1����A���BV(�*D��[F���Q�{�~#��E�`҇.Y�:�O�����-@|U��uQ"Ş�a�Ό,���]��P+�!�ov�۫��$#����0���HC�P�=+��b�^��P��J�ԱM7���Fcx�}��2"{�6#�z�ș�F�����E�{�4�a�fE�Uu���y�sm�o�zX����'!�{�]
뜞1{5�y�*��$Iπ�ږ�n8f��&m!�/��������!��3:��L�*��9m8�w�2�ɠ��c�3��B~��V���`VE�l�e2�D�n��P6���Ph�!��ũ�&��m(��1����z��AC{�]���8�ח�9&��������=R}o��=��%M1t���ȅ��$�<d�i�ٿ?��-����~_�F�b2�/�h"�f#�҉�"&�P��uS����/^����{����~����gT/h=`1�!�I��x�t����g@��{�/M>�e����(�e��Q6]V����,)c�h[�/��~	B���\��v�R��{�o����C��3T`2!�HT�ņɃ؃����_�#qa⦨߽=�G��&��h���k����<��GIbT�'���?�c�jƞq"��5�{E,�^���'�×�de�$���I{F��0|�| b�V�~���̳^���4V�zg�U��+�l�ِs�dOvd�ĞQ{Y�/�Z�g��>F��~�{��њ7l��FmF��m`��HN$#{�0���*�=�+�/�.m�Jd"G��	�y԰�g�Z�h���n:PK2}=|��ۇ�5Iɳ^�Wk��i~�(����@��l�P Zԓ~5oI��G�G���EU���R�aϸc2T�*'�8��&�r�KЫZiǣ�*�xd�w����-F^����o��k8=7��.�u��.�C�Y.v�E��ar�B ���\^����KQ�9� m�[]�z�ӈ%��Nz�3�nZɯ���3���(/׺��C��WW�`��79h?˻�~2�vcy��G�X� ���_P�����)[�u� ARɸ����E��]�P�'y*F��[]�(>_��f�,��&�� }�S]gc�k�?�̤�/��隍h	>�MEMQ�<?N�
gyε�W~l-=g�/��
՟����f�����C�n3��㊷��-���2�(~j��pO�&�H;}f�7;�I�]f�7�=�XP���17��5o���K����k�1��N2t�����V�c�P��"��8�����:e��Pu�b�o��g�V
��E�I�����0��n��$C�W����3�bJ�
���L_ڪz�^u-���h��ȕ��:g3��b���9mX��c�*O�Ʀ��[쇙ί�6�|^^�[��u�)Ȥ����-'���ez������'$�ۼ�a����Y��-�j~
J�_�"o����ws�?�I�m'�XA�����"o����o���z)����˻�Ȳ=�Kj:�0D�d���t��qeo���@�Y�9�^ezMA[����	r�E 2+����9+��~�.�O�������>�d����I���sYVfEf\B���W���3=f�
��ů��2*��Թd�N�f[�7�4�WFM�\�"g:ʨ6�jp��2*#�l�����2}fb_-,w�0P9�@�����F������"�7�� s��	:;��C�6o�G�E�W�ұ��.X���a� �M��e-��N f:��������M��{oڌzM�����y��k~6�/�5�鄣����CFp��7�)�����ew^W�:�CG5��lD���[�t�Q1<һ4�#�}G�@����Q2c�yz2�*�����=�׹����|rR[��/�6">gf�����d�l��mNj	�����ڍ���D	]�$?M�}/��z�W
�B�����ai����d�(]��.�q,y-�*�����zDe2�Ɛ��)�\
/s�bp1��E��mM'3p@U����`4/+3v@����_���Ύ�+n[�y�5��.��gqZ�����=I�l˪P�x䲈�i? �	�N��磹:p�Ԑ��mF<��돳݈�̶$z_+�d8�T|�C��l��"�6v2^���3��ˌpN"	���NV�z[7�_���!E�o+��e]*ό�:Η��/�	�D�Dfd �2)s{�X'+PH�!s�y,��)@�o��h1����s:#m�n��	 �6����ǂ� �^�-���1�����t>g$�b@��;�h��E�v0���k�k�[�go�C��v�i�;�a܃n� �?D�v��l&i�`�-���@���R������k�,��z7ăQaj2��8Q#�Hb����_]'[��o��0�H��yZ�*% o��W���!!.�;��;����-9q���m��d|���ǻ�!�q`�QL�� �HJy���D�:���_�KIO�&:�PIL�!�>|�H�aR�߶ ή��N��r�.��xx���Ɋ�,��r ��7��l���7�������/�(j^0b�Ë9G~|V���`���_d��mz�D���Y|��VG���?N�n�yWi�^/�5 �2�e�������8��y�C@i;���-�B����l���,d�i�nih���A_�&�������m�B$��Z�����k�d�L��fS�W����{pP
&��:�"����/h�m�j0�$��%~�W�����lY�k��z{��^?��h�`"�n�ly�&�k�N����4�_����G�k17��R���]^{U��zї�I�A_H�D�~�j|�(��TG��vԁi��Τ�c�3��ilb���-g���}g��`�,�&�z>H��Ch�F�����x?z���$vZY'�[���I��/�D9�؎"����lzH�.��([:=d2 ͽ]�N:6JX��pm�zjus�`�#�qі{�\�d�,�=����H��F_��k(���sy�R�iU@$�3���y�X���D���W�v}/�u`��^�� R�����K�B��A`��^N�-�@�l�����{���Cx�n~:~���L�R��q9�`�R���Ȇto򿑋�zG�]~�\�� ��[B�$������Ofdj���X6�⿀����Z��9�붡"�H!~m��������W��g��-lu8!
�4�,���>��(�l/��'�N��M���\��`�uP3�@0o�]�{��0eQ:[;Fk��&[�6듈Ң)��Y�պ/v���D��81Y[4�a.E!��i�뛩�߆�*A&j��dȍ��0m4%�6��Y�^�F�[k�m��(D�^��
�뛑����Q� ��6�2N��    ���ߛ�k+
r�mh|�"�$��G�ܡ�ǽ��U,2�F��KA�}3*R�LA���͋S����H����r��N��!'M8#*4�y��X6D$�� ?��=��.�rV?�q���gQؐ���]�}���E1DΚ�x#߫*��EQ�m��|CG��)r��39�UE����}ۧ*�(�:�A�TPO��>�h�x5�)���*�(Am���g�U�E�F�pJ^���|��]�dTE%Z�m��[�
5JR�����^8������$q�~y���B�k(�(�d�r���*�(���o��U�%�t������Qq���	���DZՠ �� �U5� �w�Į
0�������UEթ!���cUaE����ƅ���8ɉ��S(Q�Q�P��e�$+5ٻlB/�[<�y}�뺋Y-�Y���j��?'=5��6/w{�,@�,/����2�����U�@���RѶ?b��T��l«���ǚ���� / ���tg����Ӯ���x�Ïp�$.�0�X6�z	�~Flf���p�usz�į}��oL�2�:T���AD�J�}̶"C%���s)�-WK��Q��+�\����(1WHzϿ�fb�j���cs�*�z��f�b��z�+h7%-�<#
��!��-�l��hs5q�Jw{��S�}��/�-Y�g���<y�~y����s�-8���dƙۂ���ӎ�Zr&�a�ļ%--��nM��|j�.V���9)�^��M���y!J�޽5�w���h����;oį�dK���9xt����_����U)*]v����ķ\�J����ߴu��:���,�Ձ���+=v�mz�%��$�:�&�&=�G��b�*��r��L�(�4���\!�'����a	�U�v'��*�t��G]ޤX+�s��zL�?#slv�=)�XS�%�R6��<�ơ{��m]q�r
��/N���N@�}�Y���w�|@���F�0��Xꟾ�V�H�b��������2O���a�ZD�M��?�HI����F��t������ڼ���V#x�g!!���3�|׬�J�R{��;ћJ�;������+}jj�|Au���|+]jlV��c��N]����ɒ���)��m׼ҡ��_^a���U���(!ԧ��J/�y~�Y�L��/� mJV:��H���=c˭��8�Ѕn`Z�ľ���������P1]�`�/��.��4w`i}��.BHK���߷��e*�ޙ�=Т��`/p�~������z�cWa;L�h��t��ֱ�b���)�lX���ut	z^����Vҁ܎j�0�%��']�pu@Rf[X7x-�&:���+��ɾC$f��u�>2B��D��}������]�ޯvV6Lt����d��#d˺�y7Lt��7�3RR�t~��Qa�㌭����Pr8��:Q��=�F[Mߟ女�U���o�u]jl���G�Bg����*��m��	YζF.�ml��=p�IV���z/�kT1وe��.0�lT�و}�\n���OFvZ(Lt��E޸����0��n`�o�\HS��϶iN��I^x�Et,�s1
�g[E�7g6L�ʳ���H�Ǜ�^^y��r���#�϶T>$@�Iy��r@�e�M�϶ޠ˽����b+鶉3���I~y�Eh팾.�	�#/��-PI�a�W^BA`�&�&y�%�w�?+�����B���o��嚗4���䛗��<$�ߍC��%w6'�]��$�l[{�<"?_�"�}�x1��[�r�[�1���C`�$������r�C�;�N�s~=���� ���ճ��$W��滬��j� 1�v�Y�p�l�{�v���ѿD9�ն�%1fHb�I|lM�W�]�ΘV=w;�a��^m/����r֫m�����/EWմG��|sp�_qզ��=�W�{�B�?&G&z쐽�6;So��i`ކ�9�N;���n�a���tu�������Ӆ�@z1��ן���D?冭:[�3iS���б�n���J��x8,fhb>�	r��Q��X�|jq]�o-��溰�C,��4�Cڟ*�m����ٵ(E��!�{%B0�)��!g;�	*[�+����?�[����,��+` 1�b8���o# ������� �{���5�c�n��!�a0ewl&�H�3��z|�<�CÀ j�QP�����Ah�ݙw����iE�Yf�!O�VQf�˪FMp�3�`6���wL2"u�*��������r����,$
1ʖ�1���Ifٯf��;_�q�������{��+v|�oI�9���� �#~Qeٜd� �{���ȉ��h�_���v�3g Y�A7�1szB�E�( �<�ۺA�#,ꍎ���&�׻_�GHX0�@�W�~O��U0�`�m�X��1�@��0vݪ�0bɚ\�����1�@�f�Ak�CT$�6�R��c\�Z�u o����9cT�-��Z�e�FCT�^��x5j��5G���pl^�`�_H�4x�����8��}�:���g��Rx�[�3E�+���X����8<w��2��p�����ӡ����k��0E���0C�ֶ;�-�(8F ��8���9�#�<X7[��fĹ77��O�\��Ԕ���W��>��ea;��(��R&� 5A�Ҙ��`4��u�l�>	c�z6��J�cx�:Ju��������ʓ��kQ6)�e�S��a���&�1�6�1���Ov�����VF4���dxі��ʎ�j����R��t�pP(e0�Ǭ���Ͻ�ep���E�@��� l1Z���V�ݨ���l�Gg(��	k[����=���f�ڦ(p#��Ͼ7�����4�pG؍j,9�!ٞ��u��7%��-�߰���a`���|W
wH8��ۈs��gc����q�6��1T��\Ѽ���Vr����{�ں�KI\��J�S��C��V���s�0�%qe�}�G�Ȳ����<�� d[��I�[�D�ha�w9`��r}�-��W��\#Eٖ�]���Gs� ^~Hn���#��]���(ۊ�}�'s�Ve[y_+��X?[?��ǟN�B�\ɰ�������(#�v�r�d��(�*|�Xw(��M�Q�}l����r��2�j�\���
�-�?��h���bK��3�b�v�[����pap�{�-�7d8!YŖ�W蔤��Z�����EU��[��m�� ��������b9���k�6G�M)���g�)�h�m�US;8�4����o��\��Q�͋a���#4c�&8|�$�I���W�}�b��uH�Q�g��`�V��׆�H��t�$2�>�٬�U��cȨd�wx���EC�"
�˻
Tj��H����Bki �O�hMs�Ʒ��q���v�d�M�j�.;��$�����87uu�+)q�^��z�
=*����z�����e��,������7a$�%��UG:����Y�哞��%�(y�J��`��0ǭ~�k�����ϼ�t�(�b#��/��K�-�坽����r&c��6x|RFe0���0 ڛ^��� - ٛ5��J���t���������#;<�����36W`�pQ�yy,ʁ�P�1^/�A�����=
����,��C�6"����?�{�7J1��"S!�_Q�Mt��D�vC�t��h�`B`�^�2�l�4u��������0�EF3{��З�;��7
<�
E��������4��.�$.�З&��z���Ta��'O���y��/"�@\'
���A^�H2�n=g7@P��"W4����Q��KL��?�#��� �����P���g#g-� $5؛��s�~V�Wui���D �u*�8@2�dO����8{B�غd�	ih|�\��D�����o�G�#���~>���2?،�� �L0U�̧���Ddk�H>R���0^F�f�������;�T� �e@E�C����7�����~�V��:��y���SM��M�fv�@Z�,�y��d�_����n y��^����$�Q�ؐ�C�����qQW��).    �z��e�I�R��^l��d����uV:��Ԉ3�����e��+�t����.u�{�W�
2l&�tO~>�u�w޹$�:������ףߍ|�`o����n&9�k�!���m&%9�{�ױf.z�8��8����|�Fb��� �4��ra�`�:�����YLTu��Up �(�����w�a��u��¨w7��M���IHʆ\:@n�g\�8�~��J�f0`/�zF����a|.2и�����IS	���\HQ�����  뵞�h�Nb}="�h<v
KЭ�h�%�������X
^>s�j���~���ͥL���:O�KU��u���:��Y�X��S�N,�������4A��U�E�~2�.Z��r�kIL~���.��òŶ���&�(j�*��k'*94�/g�΢dM�^�r͢�:9�kQ'E�2�.*�z"��M_�:�XV�����6���n����l�t��d3NXY���ɦ$5��2���L�p3ց2�v��9�k��g3�q>�\c~n��&�s��D���%#u�����6Ӵ���`�l�i�ϸ�;gs����`�l����j�z��I�Kȅ@�9�c���!��u�f�62|*�1��H�
�X9���:gS��jo!йu�&�^��ņkrF����C}���#6a#G�%#ަ��y]'ަ�]͛��:o��G���[�m�i���Z�m���Lt��Y���]���:������y��ktn��	k_�G[�h^|���T<��B��l6�N��6E�K��W�C�6�=����M�!�S��6;d!bm������*�W����������O�������4�B����m����.��� }ю��Hu���mU����)Зv!uz��-��vGz�.̝����n^]���B������m�Pz��ʜ��ʈT��t����ov�mn��ۓ�h�V~m|�����?7�G����]�y���7�n��6����وJ��E�(�wvXt�2��.�\qg�Je�z��G3����K��#�P�Z�\�@��%[���R:�.�b��n{x�_�d�9w���>�K�����u^���-�����l�l��~�<j��N�K�`3�4��.�b�Y?�O�]�d6@׃!��v�-��h�e���n�U�=����n`	�{q����P=n7ۺN��(N��Ͷ��Nk۶�>��mag��?�;��D�Ͷ������N�<\��@m�A���%,V.��	��[%��Tk?@�(ʶ$���C.
\o����T"V�D:E�NN��XpĽ�c(���{+�RvUN�WLI��ftK��9{���V~�`�sy���Ɋx����θ��2w���d	�-K�H��RP���lz�"�"V�:���m�@!ri`�:��%b�[����'yry
d!-����O��'��)uT9}Yg�Rd�gYr����l�	ұ��Ӵ��g*i�U���/�g�dR����XyYﭸ@�B������n.�� +-bs��6�x��lU<f��K�n�:Z�"��說?�]졲L���R��4��[Q�M���@�>α�~�1W;Ƃj����ph���Ԟ,D ������?�?m��{t����Z�Wc�����l<E�r��h��'��j��A}���w?�C��d�����$����Cf��a�s��N6�71�}!��ȳ\���y<�f����fK�C��Bde�f����d��f� Of�����@��A��h���8HW�8�=���j Y�oz�e���|���7}�w�b=�+붬Aطơg�4����t"�S�� ��U�8N��.=9`���d6�Jݛ��9Y@�FM��e�W�ھW{8��
��:��m�B�K4�ؑn�N�Eח���-(�J^��bc�8�A��V�<Ym/�a��F�H諴we&��	+r!�|��$��m�V&@�{��Ԡ+����4$S���a�Z������[�y о��Aa2�j�7��%�݊H�v��q����U�T7�$S�P��v<�G��㠟-z���-Wgw7�����F��ߟ
鶡/F����q@��~GdR
��J���z�sa��'��v{9�����Ѕ��V�v�p�:@KYmi�x��5Dt��M����q}j�$.��x�<Y�Ϣ�{TZlDi�V�';�[�b�����wj��b¿�$��j���|x��J���OO&�VuTa�5�o�{t�Q#����x���_�$*l�rzy؃��N!`AQ�6<>Ճf'L���#��.�Y��|�Q�\NG���E87����@�>�~P~����<�[�Q�oSC<�{�|T�I0��L2E]� �KH�˯6¿���+fQ�	��pD������#�!*pI^ު����Nr��9<�}�4*fIA�q�����:
Vǖu���o�G�+��zEz[Q��(��j��1���%Q۲t����K�K�6$lNL@�Z�[Tؒ(�X�̈́�h%Q��J�v *TIP[Ᾱ=�JDE.	�j���M<=�����r0��inͽ����*��_QfT�E��X�vv3*x�BA�����m�Tܢ������%���[��-#�~V�}�o���YRոU��x_R�uC�l�͡
Y�Iݜ"�O����G��mߧ=�#�;�74%�n�"-9��:~(h��:�yA��A�)D�.Z�(qЙ��I�V#F��AB�jR$�*Ve'>�{פ@f��.�i���ܬ�?�N��
�d��gc��tK1M�bgE1�h�=&E7*�U֝��}�r�M5rRT3gu�����ﺙ,Ev������8}�G"�j�ϟ�2eRx��]EGL�\���GW�3WĴ{���bU�*߶����FU�ʨ}��#�Ye�ʷO���&����9�N�Bg�r�>��[Q��p��h��U)��f���I��ccQኊbmxٱ��(E��Ť0E��*ѡ���䜍����d �P�]���J��~Q�h�8"�h�<|=,I!)dQq�b���Q��L�
�Xn�[fR���Y"֜
UT7י	�v�(�����odM�
Oy"AK�Iሊ]���'U�WEGu=麵�NP�Ǹ�D�ʷ�H�`�e ��<ƺ����UY��c���DU�`�j\�Ϙ��"��v�~زqR(R��|���?�����&H�i�҇��hDu�ʷ���ӝH�*f�����*�J�Ϊ�&m}��_%���U�c�-)8Q��n��+��l����Jm=�L��hWy>����%�'�)5���O�<������V�j��>i�����D�"�+{a��H���(O��m�d���_��<��_��9�n���w_V���bY7T�-͎��Xd�4�n��������Jvj�:�u���SRPT������p�u��]�Q���� A���SL�[)�������&Z��\�-_}�deu��F]�#Pb�[A�'���
mB�m�*��#U��Ŷ���&��P�xe����ɦ�o����-��1��{6�-jR��[�g����a�]�i�����E���@T�{|p���@����5�J�S�g��ɝI��	�8��/�Gf�5W�����~G�[|qC���^ĵE�<-,tw4Q�@Yco������CQ�&A�`�>��{����jrE�����������h�ؓ�t��Ώ� rC`N�Cf�E_mr�˿ad��YY&Є��X쭪܊]�!���+:X2P� �*�5��˜����8ˊʕo�w8������H�bU������������g�@�y��=d����ޗZD��X��u$�iRyiA���U�#|�;~Z���?|`A֪�ŵ�S��pd��Y�V��e5d�����{a?.�7�����>�=��9@R^�e�)��y1��$�Uy�ݟ�&0;uSG���ƫ����31���i�H��Ľ6��x���Ê�vN\���$�y�0C&鋶נ^̿Kٰv��P5@�~�g�+�sa��ސK��3��1�J��'�T�kt����~�}�lI��"|X�S/vG꒑m�E�H���5%j��    Y�͢�����1��n!
[Ա��
�p�j�a�cZ'~O�ĸ�B�`&7H�~�v���џ.��z��'ѭr��D!��(=$��+ �ԁ�I_h�"�
aZ��YX����`1��|�_�#D?�_��ZQoH��j4�]w���]��a�H��f/f5��!��O���Yh�����eA�mL@c�ɔ�� ic@U���Ԑ��_@ ��F�MD>X��AH��Zz��zq�l��������&��(�$��@X>��U��7���ķ��8:��O&�ہ(�zQ����(à���@5��tL@]�E��҃<�8Zx �cXT�A��/+���oV[3�M��N"i�	�N���uy|@FY��&CQ���oz�'k��9R� �Ò0U�w�n6��!��"��ҿ�D^bP[l�Q��� �z-ة ��,;҆��
�i��hp������������cgQ4�1�|MD��d�a��p��������������v�M<���6t�֞��Y�V}6CX%���I����sِ��D�f�Z�}���4�2��Y��Ni�aa�E��)5�£�z�L֓�V{sٱ��fQ#ĕa:�Oju��t�a;�Py� �)u�������i�n�;�6fR�f�vi����dq�����+L��'�1�e����[��<|�EV}���^��h��u�B��I���UIP]�Ėy�B�;_Ȧ��f�C!A���ݰKlw$Asy_��}��^�����>!I�f7 �n�u���1>a�{�I��z��H��˨ׂ��IɃ}͌�˨J���	Y���ec�#��"xFJ�~@�'N���[�t����6u�!ŉ]�I�}�+�U"�J'D���N���R��yQ�	J/G8�zcl��#<��`�yr�^��c���`�^�<��ׅ������`���.�ǽz i����t�9r��_���,�,y��d]&=.OvyH:��r�+8�S�Pb�y=���.��Z��ݳ�����5�ˌ�Ab�v�Lam@בƤ,ܑ*���+��-����^Z��!A��G�eh	��́��N��I�����?��K��8ITz2��WK�6s�(,Вmڧ��[�j4ǉ��	�O�xٍH���
j/wCH�sQ�Sb��������N�I{�ś㤓E�7�F��<�S�bCڠlEƨ�'mXM�%�"���)Yc@��m<_�"e�7�7,�~�.@_(�<���(,g�?fB�BQG�,�%mR�9�3c_f孹=9��'����(��k2$b~0x�������Z��e�p���/<:¿���?���+�֧�Q��d�	R���$��%R�9���k/8hA����Ŭw_>��hX�s�?��9�`����.��h�S��E��&�%j���I�����D$3�� =�늤!�RC�J������F�z'��eR��^�犴`|�(����͠d(��!��h�O����6s��)U��ecS&9��{�a���>��#|��;c:�AUd@I�����@��|�+��Ͽ�>��tw�c^���ًMK��9�dlbu��!={#�5Gq�Z|!u�,�֜�bf�N��~��(�u7I�@㈭m�������\3yʓ=6����u&S���[�L�����q;G]O^�aL�I%�,�ض6�/<�-y���[��L��A���I�o�K�r������Y$�7�!��~��ۖՋ#����&����P.�NcJ�`�T՛�
y?�ow!_e2V0��c��q�/�D5Ie�U�^�%��:�6����[�ܸ����q�/_�)�`�m��q�~/_�5��z��;����o��v�K;w@m\�U)�2��g'�*U=�9�Nqє��=��R�8bu�\�c��(R�8bC�������ՠ���3]Y�y����L~�uf�\�����kY�z��%	�������5��Q�r�kQG��s ���Z�>��sKz.���Aӫ.'���ϱ#����Z�>:����ͅ�/�sH����()	Y̴����q�2��.:�����Ï�����]��RL�/�zj������zw���),�F�ղ�HL�U������j�5�����P�l�hA����ɵ��M	!2t}���t{��?gc���m�_yZu�G��?g����~� ��R;�>�l%�v�g�?��7*�㱯�G\�p�Л���_F-ض�B�G�k�ꎢ`�is�_{�k�B�'�R7v��Se��>�N�n�7�o��ǻ={����m	�|.Z�/��q����V4��~�_$�>ntu��s ��ٍ��K��?D�=ȍ�K�Wy� 8���& *bߏ�v�p&ze��� *����I����e���B��р�Ƙ�J>��H�����E-��. ��6Cu����8����<N�:ԛ݉|���$�>�-\��t�j�NG]W#l��.،����FN���ʑ�o���6)�QݪOR�ȵɑ����[�!�)sRn�:�� Zm�\���8F�t��BH_�)�t�� ��L���Y��n��mcV�H0iB�n�~���c�����_R��G���ڍ����?ً6���q�����1>���	��6/�����`?O΢�ɏU�8�(�l>֦� ��53|!<��K'�K]6I�%���hS�ݐ�΃'�k��7��C�}��ף-{R? �i]��#�'[C$h�j�[Cl�!��J_P?9�J��b�9RO�����Â� D*�$���@��:.rp���;*�[���0���)�$N��f>%����6K"|E\�t��dA"�g�0sXB���PDQ/}>��q���E6;`���3�˫�x��LmQ�b�~�[@?M�9PHx�ݯ��Kg��aA}�����VU��MI�%[�r�,��#�+���8G?�r�A{��b�E�{�v�Pr���oj�	���`qk�SD3i�2-LZ�nU��l-֭���M��+NI��a̮�9�Ժo/��K�d\�.�>�\�؄��l�qeX����:�����|��EWV�]�n
$c7>3iCʏ�mP9؂�۲Lx@�Ƃ"�Ѐ�	�[�(T�V��M�s��G��OO&�LՑ��K����R9�R��֨����E9df��Ǐ_-��`1��r�񫫤U��Ζ�w��TJ��F��N�k(�]���:��N�j퓪EV~�����v�k�2Ӏ�3[>^5�RF�I�/#{=J([w���(S�ݝ6.�Yl������qZ����;r.���z�x��H��r�x�pI��^Q�2��[���r��y��rN�.�f��=M��M�Zߠ�]SŒ�-�;�- &1��SUI���r��y��<���4i�~3�cu����^���r:
';Z��F�!�F��o�!9Z�w�v���!UH*�T�&[�'�rؿ�w2����u��ly���ϟ
唃��V�ݏ����R�B��BE�`+��~-唃�޻�C�-4QU9�>�6a�z$Li�`k��JoJW��2��^�-����V�	O�6-�;m_iQ�����\�R`��N��x�	��"����Q���D�V+�i_��D֜�`��w����2�9����⋛��Q�c�(Bf�T{ Eٜ]G�W<j�Q���~�z�=��˽w�{�a��A�D�])�s���`]P�s���7�����(���W��lS��a2���트oʿ۽`��v�VTa��&,We�|Gƅ6j13�#o��U� �ه<��) ЮM�:���"��8���4W�*&H���O�����UQA
����Ȥ�@[=@T��KaAb `6�*&H<��m���R��&���m�p�� �y�tz)y������6��r���D���*�_[H�����Wy��8"@��򯫼�� ��T�i�v_�Q��u�]�ϟ��i��[|�ӯݩ��M��r�SU8�>[ȨwP ��f��kv!�P���~/V���׾�c���҂d=����a��5$��B���u��k��q�E��E�uk���//__B�O~�<    }�}�oo���M�Yz9�*�~6ގ�t\n*��u<�t� �L�ޖ��z�՜[��r���.�NK3����?s�u��5��埣�%Zbw���U���0t,C������Wy��3�U�>��ٟSڡz��HT�ϯ}?~�5W3p2PO�T��sY��͖#���9�:X���'��n��v<��c[S��v�%5��U�6�]q2��U[� Z��^�G�#U��\5Ķq�9BH���C�V�Ҵ�g�e{�U�\5
�Ǘ����I~�6<	���,�	Ѱv�~�2t����n��&�ϜS�AA�MG]��0�o���pz��&a����O2![����Ê��*=!�&"gqq���P!�O���:q�+��Ph� Nr�J�*g+Nr�3��Wd���̵ن?Z�.V��j��I.}�rO��ѾYl����+b�j ��!�񹬿A���
�wk �c����a?2�H��u'&Nr�ˤ�����|�R�m��I>��kݷ�J'y�ڮukɖ��=>������Xxh�r����זn3�|`����7jH]eA&����yY+��I~a�!�8}���ʍ����?Z�mݒ#W���kKء<���/���5��OdN�LL��ﬤrbn_���Y��;��ן���/O�=Lf'N��y���=mIq��_���w�\�;����e w��h=�����_'5��"�'N���&a��N�\}m;;��?k$������i2����
ٹ�@��x@���k�����bP~�j*��z!K��&���8ɭ׶6H�
!=��&�ĭ�-Nr�k��gp��'��J�h1")��3�$�^���PY{5���Ym��z:��*f��`�b�'y�5�@��}��kcȢ��q�?�=u'с�ПR.}��i	~>��ѡ�w�#�����7�]ٛ�Eb��c������5"%�ɋZ�)Ռ�
������H��`��kC�, �
W�g��H�f@��2Ej3��,��
F}��ņ9�v�"R���d֨��,�5�	"���$og��Z��0�_�Ƭ��G�t]LX ��/��ٚ���Ń
���0�	�  �p��+�� �,���l�G���er#���� �ghF2�9؂�Qf!Zo�
�b98�R����X������]�?��<g5�l�]N}l�7�W�P��7v|r��7���m��=]v�vs6�����_�JʰKۍDHW椛_-DT��n��z�m�+��<����:������!���-��[�R���2�P^H�?��)�������YW�/�|�E=a"�vI1����8s��X�����,sϭ>���{CeYa!��QES��lt�"ʼ��%qE�#K�pC*^i��������݊��e�ٖ��Mx�oJ�d��ޔ%����$��&�SȳZ������i�G�dXhܡ��h�_���@s]�~HK8���Ο��x���_�1՝h����WRm�.R89X�>;e)�H#�%B��H��O�n[eOK�eI�動޴�N��`�,fӕ�#��z�)�6DF�nT}b.��΢Ѣ��NDj#�8���].5��%� nQ�UkU�z���b�x}�u]��.�/w�i�5N��p����Y���������E�j�Rǀ3���v?0�m�55����4����ZӋ����y��&u��q�$���6Q�rq�$_��֟[<U��ńH��`�<ݠ��P��s+�[{��,�E؞�bM��n�V��#��t���P_�Pq�t�<�$y��&����H}�`I?ݢ�a�$�� �mCg�3�^���!o�E�C%���Wŋ�_�[q����x����O��׊n��0p�V�z�<�O5�ކ��^�>Ra�Z���C�ȳ`�r�h�;RE8X���yXΫ�|��0@�o]	g�-�6��2a��������d�ty�HQ�`yN ?�q��0�������y�6K�r:e��^�}^��v��v�p28�.}��L�jPk���~/	�� Փ�H��E� /�ڷ{f�i�7��/�������i�$���Ɣ-��ğƱ�G�|t�:0��Y�/�>Z|�ġȟ�I~!�u��&�%?۬��S�2�C��w�~�
��J�r������ǨEfc�ʹ�Q�?�;���͏�����n��a�.:���B]��Qr�#�a�����6*���-F �i)�,��:�:�<�h��u擵��h+��)8��)���<���GwU��Ǭ}�O��=�<:����]�u۟�)�w�Zm�IQ�!��ǫ�jG� Y������r��ɲ���q���O��#�mi���ON������}~r�����<���l������O�:����_6��O����EgN���5�&:9�)(��9���;���O~�:�uHd��p����-��˟,�����:��)��\���އ��'K��(�;��*��'K��.��S~��&�A�t����U]-ok��b����O��������O�8�T��|��Zr�G �B�{@\�ƴ���ْ��A����џ-�芣�}g�E�ZZ��@���ϖ�s��ܣ?�Ò��2lp~��4���ϬB���TK�q`� �"e�ݰ��q;8�a�&�n��5�h ��n���y��r�g���̶Ǖ�?[����o�^�~�4�>���ii���C^�li<r����KW�^���C��^�,{Z�f�8�2����%�-Ch_<q��U�z��Z;C�m�D���+@�k��P�b[����m%z��EWU2�Eu����]���+dȖ޴��xr�����v�/��^�CN[k�TȻrԣWؐ�١"����a�9^1D�q���/*��)��}/���N��7fP��"[ڒ�*)T�h��%���6X��7x:��2���A�_��IXoY��)�w ��M����$eH����d�~�ܗЛ��-��9��z��[��6�-g��B�}\a�q���|^�G��{B�:���C
U���ݰ ,�����E
k�f��KqI���e�c &��B�ª�{�q��+N)i��f�TI�
R�ܻ�fcUK�W�R,3lw(Ț^!K�̰��yz���yE.%O+	�#�]Ϳ^L)��Cc����Dx�c6�N��fͪP�N[[kDG�p���W�4�ML
h���޹�^�Mui�~k]�}�+��~맶�"��ְ����z������Nk]����0�g���y�e�d���M

�j��qk
�C5m��+��*7�+0��֮��6^�B����dy�=G�Ȩf���c���h��(8�9����=#;��"�Z���=7QtTk�l�HH�0���j��:�����v��H�|�F���E����I�A��´CvC�c�#��]���
)B��Sk:��A<�$��D�k_ �,��a�3�~ �jz@LP����1e<�/A��:�/�))E�F��##zL�3�;��_��E�ىTq��v�>�"g�@[�{~�G[ĢZ�X�"�,��y���E_E��t@�.�rQ���/[���Px�Pȕ3��n���3:jN��E�dƙ�o��Bf!�n���1�6c�f�����*Q����x���3�YTY(����S͈��Q3Pc܏�{�}�4���7uA��"�mapx�0�%Jd8H�^X�I�,n�����%�W��?O�r��|��=�(�����>����Yd��˕�B<Y�!��
u"��W!���*	���UI�/��I3c��U�����\Q��W�� ����d3����� b"g�[�Zc��8�aֳ�a��kY�«����H��h��
Q`L㽅#D5�F1-�V���´�zg�bA�v�/�Z*,Ӳ��c�W�����e�f�,�7�D��1��Qf�]����/R3D�$-�����g����$�X��!�����]��A�X�RC"&�����	�[$���&� �v�b!� �a�m�N1�S���>��'9doSIbɢ���������p��\t�l>�`�:�?��* |�8����|��?~gჅ�V{_�>ر�'�J֏3d�    ���k�3�`1î�t�܌|0�]G��u��H�s�G��K�"
�|ȝ7ؽ:�CwY������EdVJR�~N�UD���Q�z�G�>��|LTe��֭�����"B��B����x<V�ϹO�'A�D�S�a��}�A7�N� �;�V�3y�ኃOg{O���ݩ�`¡���+J����[���br�xE�j��xd�FQ	��BQ�0�5Na��j�:�͢�i
^'��4�/��!f�ǜOʃ
���g���w�C�_(ʘs�q���g�����,Ԏ ��,"Īi���H��_�9�RM��E��=h�E(U����/�,���_R:����1��?L�,�X�����;�l[��,IO}%d���E���oᕒuؿf��
D�8Ҽ������埵PP�`51���.��Ȥ�yui��!)�;�b���;�F�t
��C��1�L:��ZFĚ��|����r(��@�!l�����)!c͟�&�PNx�%�e۽��xܳY�Mj���k�>Y�W��A1j�
`�@��{�*��Q9���=��P�ұ ��D��2n�@?�U�^)�!�C4���=ʿ>�"V=EET���O{k�&H��je9e b=Eؾ��6O-W�������F#㔊שRg�t͞�n:�r�D�D��}0uĆ���+�o�Y�Uϝ5��[<u1ת�ެ��yG�v]�>�N���>lH�Ļ�9�>������������FUM��@�O�"���Pu�������÷�b5k�Gi?�v��Y v��dt=�:�������eͣ��]�/�pUj��o[��j%�А�bֺT��$ �q�ɡ��JTpK;�����("��Z�������.J����ӧ��C�pS9�ky�D7��7�~��",��ɷ���UgEx!N�8~���;W����~ݴ#�q���q9�}��4@:u�U�{����ǂ��n(+�o @�u�����cV�2	�PTZRd`�ʹ�WJ:����]��4X�Q�v����xSQ�o����;$ʸ�
�c�.7]L�ݝx���9g��b���9o��.�N���� ��?���p���zx� �.��붔�y	P4��VQr�(l��Q_a 3n6fT�!n��"<٣�b��ڐH(s7�%E���};P���EJ���^�߈��<C����"U���H���]+[X,Uh�	6�W)�<d�d$�7�����A�󪺶�$��u@"�bG���f�2� ��bU�o=��v�!M�گ�m��M8�V寮��a+,!����$I�i��O+}�/(k�=�U?�������ý���D/�2DD��HEzv��d�͂�Z��z0���D��'��M)g�����B^���F�&4�\v��߁<t�\��F��!P��ԟ�e�:�#"��E������HhCG����ۜ�+�Ǵ&��3h^���a2�;x��c�Jf�W��]7K]�jt�8<�%N�񋔃OBe�a��5J���2�	~2`�42�	A��hm�2�	Q�Zو}.24�#e��fs�O~��Ա��v�Jt��z�q<�dx�����ۖבe�=_�?0'D �G�V{�ے�t�����y)�r����eI&�$��BU�U�d�޲Q���W�:
UFg�������jb	�	��*$�<�Љ�M�Mg*�'�ţ�����-S/�,����z4�&�Y5 ���-Ѫ�� *��L	t�Nl�އU,�S"����ď�K#it;>����4	��L�������?'6f���-���B/CXl���ئ}���p��w����q'6q���|�V�bm��FV��Xs��}�:M�;��G�M׾SUdU�c��k{ ��+��;��:�Q·�8���Q<!|��՝l1�p�c/AL<9!�Y⎳�U����5Z`/�%e�j��0�&6������~�]���I��D{E�xUDM4Ҫ���t�7���b0oݝ�xĵB�?���qe�~��?�y��Ķ��c(�S�W31�F���v�oxC������pXʀ�R�䬞?���̉�C�ۣsb��^ Z�	 Ce'�7~�oo:�1'�'�o�����E��4~�Ţ�Cŏ�}D �C#51Kۗ�"��2�P��K�(.�,m_�ǉ���m��/E�V3@�Ļ rT�*�)��Mw��/����L�QQ�"���E��R��/U�S3�fHŏ;1��R��;тH�� 9{qҶo����� >��G�U�j��@�s6@Ƭ�"4��H��l�ِ���[�Z����?K��E�)�|<��,�>�I��J+K��������QJ}T�wWGZ}�~��R��)�G���X�;>��YZ}ڙW�-U>u&�ͤۯ���7��؄g��i0���vSs#�d=s����Ծ�l�4L���`w�i��hxgo<�֓�� ����7�ǳ��������~-KTOU �.�o���T5;Q�n'F)�9��}�f)�ډ��&r��zϒֵӫ�sG���v��#x�������XR�����=&������:�?H}.]���@����sMz�"7s=x���k��`� =ei�ZD+@��kCԌ*]�����vCM���Z����q7��|�v���s�$y���p.%KEתG��m����T���9��@y���M���<j�N��w�1H�Z��y�?���=?�ʬ	m�z	�(����f�_��M����.{7�	y��e32�3����x�(���W�#r^p+czŋ�K�,����P�%S�4�IĨZ�g�Ń�'Q��x~�y�L��0��8��)�qd2p;ȳ"��t^^E��q����R�<�T�]�X0�yߏN���]����:���_�Z�:��J�[��d*�Kz(�d�G:�)�P�:/�4�]�<v�H�:��D��V���+¼T?�!d �`�/�]���U�y�nK(o�77��5/�qH2W����
h,1�\E�����fVq4��>?���������B]��^�y��{���\��Pw�Ձ��$�
Eq�[|�?�򅒸a,��������M�0���c=ISv�1�W'�/����C�?Ο�]2�[8�K��Po�mR�ď���A;Ab�z�ە���y��8��`&��.�h�P�֒�Q����b`ɽ�Ɔ�Pw�u��qaE�v�q�{�b(T��`��	mu~5D�+�O�L���U���|p���n�Đ�N:�R(���bBQ�g�"���,&.�Beܹ�S�6�ҥm��(N���J/�,)68�c�
��P23����5qdD&�����tPO�T(��dE�򴇫� �ɪ����Y?L1�%+\�_������K^f�E"�Ba�e�M���<_T�p]׀/��^v��J���dW���d�ჱt4	qV�^Qf}�x��"��$r�^pR����G�Q�Y�Puw�aeE	 Q�!�K{�7�aO��#�ʗ��Р�Ey��]vP@�Fm��ra���fYp��HLv��!�G�(\s�����
Ex�UX�e0O~8�V��qhak����Ta�mjM�lJej���BG�6ɂ%�D��\rg���tX�i'M Q�GC�]�+Y�:���?e�9Q�c6ij�; �jGD�.-�sB��0��m�P�70������E������c!Lmߕ>��o���*���P8��	@j�f�ŚV���+���s�n��|���������!�%ǝ�E���B�k)��I�(Wʗ�0�6 ���G�(��v����`�/w+��׷����c��M�(�!��J�p�V�W��o��d���Xf2m �!��ܫ�F���/]Ψ'��v�_��M�\2D-Z�[[�ѱ �M��Eۇѡ�k[{��+�;�j����(�%���;��1���J*�9���A��LE��ɮ�ی�y#$c��]P����v�}�}�>�r�Ϸ@��y�J~^��E���>��~�>�a���!��8���/��ɞz����E;����U��R5VOE[��Nu�9״*�#L��c�_�6
�]�����=�&"�>��,L������ ���7�d���    [�;qސ�5�@�6է$P/��{F�j'R����	͎�-T����_���wԎ��hECcs2j�P=�_3˴6����Q�����omf��}Q����?��?v<��#T������ߨ}B�q�P�H���I��/hd���씟�4>nm � *f	H8w䧥���sN9|lj���/8{��D��72e�۴1yHN��DCN*�k7����0�ܒ�nGܷ�ܜ|���F�6�8���L
s�b������,�yx� g�ΜA��S���L��~}�f��qǹI��'q]of?���sǧ��u�����͉���Hf���_6"c]6c_�iթ�����#��`(Z���Q5F5c�. ���V�)V+^E��B�9l����ϟ��Z��i8���F����?�2}���{��M�MEz���m;\��A?_ �c=�f�����#�Nm+��X���N��6���9��I�>�zxx:nf�b����v+�#���'�!z8i�f��hؙ�LP"ACg�0
�{riB��Jv�~�eM�B/_��	�DmNԘ ��N{��=_�rd�2$3���0���d�б�BF��6a	�pJԭX������������q�����aB�L�����IIB�k1��U�
֎������\���_�q��`��/? �D�P�>n:��Ӄ6�@��������>�_�˂d��&�dp�$��<;����&=0��sF�p U�3�OH@�5/��N��tW�9?n���N�X[J$dc �5�ɞ�G2�����)4�%�����!	=�#��i�h�ht�A��^��#)�%F�tLh�h�}o��WL��;���51Tu��'������u ]x�y���ےd'-���=0mR��v��/l٢~�u�Af���6���&RS��?�_�9y)ك�1[i�i)Ń�����4Q	�I8��F:��l�Ӥ3fBDU�3t�i�	��"�hg>���~_��ҙ��i�k��W��+/��D���_���B�ͪ�l�͋#�hϋ��rF��/}%cc2/���Gxmy�eSr9x%��j��������	�x��M`���9�#/lF3u��;�ך@��v9�o���'?��������DQ�y�jb0Fm��)qL�Y��3%8s��PoJx�Ƕ��9����vxx�`�D���/Cdg�y��DR������~�#AӨQ"��8t�2�!C��U�LR�S�s��y�����NCm��O0IS�.F:��[d��1:fH	)Br
D�I�1����QS�����$�\S�8�k
�]z��I�����R#�n�%(�i���?p*�\'= ۃ�����$��EJ^���$�k�C!z�{6IKWv��i����Ku<�	wA����cf;�'&�d��5Hw���^#k/)�ψ���O���4�fP���r��c�E�M�����?��h":Q�"$MT͈ꚧ�^�Ol�x(��Yu��&:2#k�.ƭԂHV�Řokn��F,��e_X"ш�j��i>�rF�UÌ�w?��=��F�uZ,����F|U�=�\�pSD#���.���<z7���%,<Q>#�)��p<,���M��� ��r�<D�
"5���t�ŉ
�iEt�ψ.jt�5y�H���\,��nm�^�����7_�0QK#��lp?>�yʉj�u����������8�5QM�.{�.�2QK#��1�lCx�&�i5J�6��MTֈj�la䟦�FT0�&�k5�;h���VD����q@��GE��~eu7x�hKë�����SKb �����"N�v��m�x�Du�"�,�a��$/ l_�c�LTֈ�e�/[��D}�%/P�1J�.y�x���LI�%/�w:���������D iI���M�t��2D7"Ad%y�?�����>ʅM�Xa�/�6Oى<���+�A]��PT#8���a��kMe�X��^#&����@�_	��FYK���G�����l�D]�l&�3�#��C���M3�4Qj7Ӛ�l��c&J�<�;�B�_{�:���F�7��>��D͍`d�`�	�O�K�.�_>��Ms��ױ�g��~r�mD۝�;��z��XE��Qa��\Es��%.���;��A����5�MU��!����{̦����ϟM�����̯��M�=R49��b���eŭ����`����JY��ٴ�����Y&�O�����'�J��Z����J���Y�痸.�T�{zC6>jI��o�R�7���6e�!՝��*z�H�,��h���7�����h�����ǿ+5:�b���8<\)��r�J��W	$�B^F���<���T�b��o��Ѯ����9I�g��m-��"q�n����i�H�}��R�#&5�z�*�9�Qe�.QE�R�#�WЋR�,G�(-؍���$f�����)-c����%-C��J�O�+��%U|����ʍ��U�{�����k�4V�����:\^6U+��we#놞����JvWt�!t�mVʻ:D�D�5Ui�jE�i�*�]{�
Kc�*�]=1G��T����&<���Du���/�K��:�Ѱ��q����y4���*U]�h��Qk��e�.bW)����!���Y�ٞ�J=�,�a1��u��F�c�`~�(��ߦa�E������Q/���Ů�J!�4�~���[8m+�4�v��J=��q���w�����F��JI���qAB��,~�ņ��7�D͢ǋ�ܰ�US	�4��F����Jg_;��*�G�N�RB�褀�@|����=��3�A*:/Φ_��J�̣M��{T�8�R@ރJ���
!�W���Z4|/H���R43�6�	����?��ޏ/3*mM�|��R*��V ��ƫ�"������5��E�fT�*�'��e��hT�(+Î�J�ܐ<lTeyxp(�q�t�Zn�(���Z��(����ދ/����{\I�e��ۿF��vP?��T��J��RRA@8�+�3�Dq\�R5�԰ q�̨�䡁�X�)�Q�[1?�ƨ��G&%��~����A����.Fs_n'Uo�b�W.p`� y�Wn���U��>yV_{�IQ���s�;"z^7)l����=V��>ybG��MjL����v��I�J�O��ߣ�y���'����-2�*={|�mP~0(^��Ņ?��T
�>�q�Mڂ`��0���SҐ��y?�Ĥu0 f���y����ˆ���>��[7���8Of=a�(?P������� ��E}_��p8���:�w���rS��i��a��&;Ş����J4�� ����?1{v�;�A&�	ٵ���v{��"���{�>���$�ػ��i�O�@?1;v���d�إ�Co�N�ib������2ڭ��@H��;JF@�ۧ�C��`m�""8~������!_˟�R�G�x�h���R���i���Q����<������������/���Ξ�6�\�	�ņ:���%�D6&�r�k81zBv� �kFA,���8���eP����8��۫?'%�]8�=��Tm wbv���Aȝ��8(��xb�D��A�������z�'{s���qw!Z��|��Dh��=,.�� 
ض���/s�Yjؾv1�˼�������_n�0٩C0 ����<����[$��<�֋!�R��ٖW�G�]�G}�n���T��u�s��j'�q>-��C�#��lp�Cc�S|m�X;|�!"��oz�g�����mܘ��Ҧ�S'��|�j���~X^U�QuB���MB�Ľ�/g3J}�>ݺ����#\p����Np���s��l\@x����Ȋ(��aH�Uj]��՘Q0!�C�:��yۿ����E�jh���m�i5�H���g�򗭥6��e�k�:��$���-~ݿ���谒W�5I�t�ޅYcubc�"�я����WII�J�z`�CǣuB�]�.�Ƒ�5
c����oA8u1*Bh;���GQ�������` ��qR������2qjj�7_�"N+����&�	�Lz������jH�<�^;x,��:y�p�f�3#�Ͻh��༏�dY�I    �x�`Q���
���f�I�!n�Z-�9�Ɖ{uRB������+Qb�{Y���R��Y�$���˕R"��6F��F^�h�B��e}��/`487)p5��o��랻����k�o)�����龽rj�a��&�����a��v�8��*��t���g\=yJ^���(�(	'襫]�a�8���l�{�:+v��"��f�/�\�Qk����
� ���p��)�Β�=;�0�/_����g�T𘧵 {�jb,�rL�
��(�����ОL��e	��*?��4�l�'v3�.1�
��$K7���QjӃ6�g�c��T�\�dV9D�	�K���Z",M��O��_���:��%Ƃ&�zj�!�_���"4M����lG�=d�Mߍ�����^V�d�.Fy���J�c�Ld�������nx����Y �)Cpp��_pX��*� ����Rj�� �����q�@�e*�(ÇR�#�9���:ԈR��ޓO������D�@a��	�h
��P��1!L��I;��a�'��w$ey���q�����}�gY�vnh��@�F�[���\9�qi�>�>�(�6��rB�>�%8���g�!�ꨑ-B�E5v��h���� �&b���ܶ��u��T��F�/������J�(ׇɞX�/��0�󘯌 5Q�b>�4��05�Ci����a*1�T����4�X�yY���L�� |7���d�� ]�Tz���c�1BZj�~�G�mE<��ag���V$����ξ��^�:)��֑��NY��,����S"�^�&ߴ�B�����ZfjI�j/��O'm^�oO��$(�Y�V��3�J�)��_�	�<�^�zШ��@� <m����l��"��r&���3b����_����w�Ŵϼq�+�Jٝv1����w�9��A����X��h�t5�~���EN�8O��ݩ�%�1M�Q��񛘃)�SKʚouT'�I,-����	�b!Y�x��C�(�S�j�y���^��SK�j��$���S!�J�X@.gtЖ��$O�������3�󢂦��\z9�P7{}^K�aEɝz�"h"�N@<�k�e��W�����<�e���N���}y�Ձ�)m�<�e���<��7�u�8�
�vݣ�N����]�E��{�����HM��2?/�9�u�B��D����"�" �I/��<�Aݝb��3N�/�ŧ� ,J��W�XV{
�4xAZ���g;�o�.�<��l��Aw�B �-�E���ן�W��^�X�CYT�۰�Š���G��4OiS�-��K}P����;����2��@�A]�T�2���I5��׮���S���e9����!���f�`�8	y�����&�Vh����w"ƋUt�Eh��{���?�_���l6��<e�����z��R���T�M}�4	ٟt�Ŷ��N9��#�p}�{����ABQȆ��m
�k\O��r��"�r�^��<e;�0_$~�|e�����]�_=�x*�!��,���ɦ���G(�S郎��,������
�W��K�,Iqv�[>v�B���iKV4��6bF8��y��&˶���O�ly�����ؕ$���<�A_�/S<����8	!X��x�s�~���>��-�n�������m�9./��j�4��@���p�(�Ә�c�љ��?ԛ[Ƥy,�aEՑ��v�<�.�.oƷ�SA��p��[���V���C$�㰹Y���6�b�b��AǕM�k�.ʥ�!������P�]�'��g/�Ǿ5�9�i�^����W�&7ȪI0D�u�`��Wy�n�gc��%o�ԯ����o�TE����z_��2�M��z/5Y��xh����7����v#M%HݖfQ�J���iv��,����O=�Í��7O;���3�)ՂH/��r6EV����%����Үf���۵O�i�i<�az��6�@8�V��5�m�@z�MMM+�������kS�J��?ve@蘆e�4J��'1��ֆ��+�a�8wjT�x���-jL[�Z�y���]2P�U^n�Z�e;�q��w��v�Xd�\Y�nϭR�u+�����)�����Wj]��kO�p��+��l	����(p��3�������>Ө��]�����ݸ2�t����G{���E?j�!�]]���|�!��n���넒�nY�/>���4�em��o���:����k:�3I���:�.hU�� ��b�%�
e�䭋�Wj�r�0�d/^���������Kuġ���^��X��3�>`7p��HS��[�=��Ǫv���G�s���X��m�>��//"�;���B}?�2qc��ZC���o��=wE���(�d�n(�^���^聻��{���>�>��"ٰ���/^(��> )���[�"A,��W6<6�i����YR��Ƀ�-�����bH1�����49��-���<��\m�fnt���`x�C���Z癁��<x�
��+.&�[�_qE���׍6����M�E���v����/���Qw�dFL��ׯ��]U��6�C����=�m�>~�4����v���?�:iI^v�C�:9y�A�%�O��ɬ�^ʤ�:799y�A8�np2�D jL�r���2t��e �J�+��^���&��U��y��Z����~�[p��J�v���燀��MJ�����~��{���Tk�q��܅��
,��v��.�GB�kh�w+g�G�ٛv�����G��L��/�td{��p.It�q�C����b��A�Vn#r��l�׬��{�\�<�F�qˁۅ\�;k�&7(�S��Z1
RIw���Cy#�����h�.Q7	�����~��~�d{�}h���.8�J:`4dqf�zI�j�����k5�CwUs՗{�.e�"��hO������CVά�t�؇�D�N��R`�'w�+� $y�MZ����rͲI��������pE�r�71��������9�TQ���C=GSG����c64���y��gW-D � �Vq���q���8��H�?�삄�yҠ�x�v����%�Dd�v�_�|I7'� [�I .vn��(���n��ދ�&A
��L�s�]�4dC�$��Rv獚@�Q�U7��S�H�$��Ra�Z\o�22&ET����%lJ=�$���OFCq0D �(*j(��m4�4"�xI�DOY؎����GQXP���@��5�1M�)3X��[0#�I�I3N.q�'�$T�g=�3Z�"{���,i����g"MCe�N������_&]F���X��0�.�#�g�F�H�`?��J?ȕ<Ig^��J���
Ͼ��Y��GXc�U����OS%K:a��mh���Y;��-C�fV�#EӀ3�PKq!�<	����>�~�?��VR%�Sp�m~>x�$J�<mzn *(sħ3|_�C{��U�TS
����n����Ȓ,J�n��9�6����o���S�|'����o�跾�I��M;�=��p��v�;�G0�gv����vR=e=+!��J����ȭOa\ۧ��6|a�g��M�nhX�Y"��[BQ��C`���j���&F=O���g�ߑ(����>}�Kn�ר_�p&m��*��}@-D�X~��*f�>0h#
��x�]�_߬��O6�F���"ZIdР����ʎ�I��ݷJ���4J"iq��a�N=���)ߪ/�8j!�I�Q�<T>Nv�k����s�z��p$W��|���^k���LC�v/�Ό�s\"�U5�N}B��� �n�xVz�������3Jl���(�};ul���凝����薧�R� ��'dM3�6>����C�Q���(��V�M�mG�Ñ�p@Uc��Y�g �MD��s�ƥ;�����'���w&�����;�� :_�Z<Q~�h��m"y|c��{���o[�<� �xD�<
%��8|xO�R�a@�6��(1LсDf�g�B["=�.$�y^���(��_�K�g�����ׇ�4�������,�$�6���dD��86M� M  ��>=��G�KS��~j��8���bˁ�(����y��H��ǧ�S���o}&�J7{�~��D���#�o�dZy�#%�Z�~���ȶ2G(����NV=�?
��CR©�rV̍��E4�Ǆ�?"�Q\DV�-�E������n�U�#),��}�F������5Tp�d�1�Sb-\O�ˎt*yqc�����H2��7����6��'����N?�'�]ceI��ǧ%����'������� -uFr���u�6T�$�����GAR��7>��//��HZ�(7>�>d���)�ND������gȩ��F���/m����ħTys��~�3>�U%͍O��G`�M���YC���9l"�#{5`~{L�DcS������4�9T&�螑���k�"+M�h.���_z��(�[?�K���Oog�y��H��Ƅ�|�:�~�*{�u��(ey��?�)%c�H�_v.hb�J��e8��v]��E�|{X#j"Xu�sx�K]��[��ol-4������d�ɤw��a��:�b��{��y��8�5��m�|�`��~��0NHG��k���iQ*�1�~�>�6�����C�n��$�f1Ǔ
��K�[?���m�؀3@�f�#J��}6����ѱ�?ؑ���#���q�Y%`��k����ȧ�S2_�_5�A��p���4��V
���8[�	*@?�낇&� P  �m���脊��uD�+��U�-�v�G=:_�(4�V4
L"jF��v����	h��g�t�?&%tD�ƾ���\�*���ۣn^��q�PA�gw9���M����In�ʞ��.~��?�y,֍��#]RX3:P�DF�T��c��m����.z�PɃ��\3�������( 8Z.�����h��F�܃t�. r����-�[u=�k�܆t��ɣ巋 oJ �-_=��lI������9�V�P_7�@�o*7*(��]N���t:��WFUF�?�oG��37)�2Ƨ���_�I������E� Bș�4ۘ���r2DN��7D3O�e�V:�-�K��p��$'��M.'��Dړ��`��҆B��i�;'���y��O�}�?Iܡ�bg�-�Ȭz);J}�$�ʱKv���-h�w����a��@sOl��&�]"��?f���p�E|�,��5,��6y���H[o�����x�q��1�h�������=�۟ܮ�����L |�6��o��^Y
���&�t�aq�fP�����Osr�gC�v}^���;���-?������� ��e����k�&o��iA���6�L���M�f�����n�M�����_����Q8      	   /  x�u�ݒ�(����eODO�~��.�L�TI$�t�>ƾ� ��=�7�y2��R�u��;��/���*e����`�pX�s�J�(;�i��n�1Ͱ�jU�|3���14�6�S�Q~�J��F�i�.;���1:�k�a�����h�qKK�J�FƋ]�On�ce���T6ڣ���n'��7e�����ٍ>*��}2�МL�j5��}�Q�U��p܎�g�ڞo���f�L����(S��~�x��͆_l�٘^��Nv�qH.��W]�����a�
ձ*��G������k% �SH�*�5�:���.��UgZ>c�V]���?��nTU�%����U}!ĉ���{��ߒ���w|�����;���?���L�UY �1��f��JY4�:F���\%��°�΋�ReIЎ�x����@M�[|�]_�"��BeI�0o�)-�`!p�-g7�)+B0�c8�\<�_�8j�J��L6'��&2�1����J�b�
����~
�ƹF���6�o|����I�<ͣ�v��kK����Z�����Ϊq�I���~�^K��{��k�nc��Z`a�5�o:�����T�RNt�>ۛ?ٓ�P��h�1��l�[�h2�lCX��;�i>����#e�Y�tLI��!�C�BtO5B.����-	������h�O<�uّNC�O�Bgd#�)�� /O��,��_f=g�Y��ޭ�ɆW?����r�y5(�<�ps~\�Q��6�`�Ee����$B����D���c���ě�8�y2X��Xk<��Ϭ� {�*�7��WA�5��Vn��T!�o;f�4n�Q�� ���6��%m��}��_��	4^ippѯ��JL��2�����ъQ�O�_r+TRi�q�uo��@�@T��y��jHNK�vCٻՇk>��Br���]Z��{n(��"�`h�Z�:
��7�Bg��տ	�����Տ�*���M)SfY<�q�-���Z���e�OI����w��:�c�#���(��݋�á�o0$����]��/�'�2<{�t�T=��㝜 �� �stC���@:��Ñ��
,�����dq/D?c�ܧ��L����S�
��8/�gTJF�p$ �0n�`��O��b��C������ި���Cf/##�adN��T���ϣ_h�I૴�l�<^�<�1�֠y�>SI�k�0����)�챝��IF�n`��6���G�3&��ޡ'��Z���-\k�6av�n�+C{�����h��l@�m�f���$p����>J����9C|����dj�A�~��%�=u9 �v��u����L��o����D��N���� �	8��Vo�2K�>i�Np�[�'�Ɇ�����6���+�7ڰ���/�Q�~jtG��g�)Q@���G��5Ϭ�P���7JD��qkd�9҈-��vA���'�݀pՄz�n��W]�L%�Hk�7�u�R!�� ���܄@I���a�	M�K�i��)��"p����-�W\n
��d�vR�0�np�K)�����֕�ݳ(u��閂�>�����o]�_�Z��|m��I'HϦ�]���)I�d�(ռH��!�yG3�"!����r����0�k���5��dģ��}7��O���t�ٶ��]�EQL�gXWw�	wzIM�D� &���b�\"4qz6>|?�8ɒy:��kO��,h�]Xb=�m>�����:��u�SO������3m
�ͧ�CtiN"��"݋�a&-���-{Bb]7���(d�4q��=��<y�	��=ҐH��˜k*�A"-M ���ٟ]�B�MS��a�+�rS���/XU��a|������4��DSd3��sm��д�4��܇�i��)�ė�����W⛑���~���� ��m9�`�w|��F��a�{���S�����K%7��c@��M�B�ba�,8N�b�r�M'��5�e7�������ߵ�DB=�!qA��������4|����8�I�4=�J��<}n�%�mx�ѯ���J��R�A�n��r�.8�X�s����@��ރ��i+ ���*Œ�mQ;Jn�!��dn���m'����g~�Ȩr��z�!eI��w�m!��XW�Rw8د5�#��~L�Qk�ܸݛ)p����B�(��G��Rۑ�%"�0�'�(��Zh���zx��JNfw���$�ء����� o��N!o=E�;�����l2�����<2�i�r3�������	�d��e(Ͷ��?��A.$b�guˏ�#D��+O��S�)�	��+ed-_��+'��=?eԬ!ɬ����ĬQwq]�A�E(,�Y���h����B>y��ź?H��Rʧ?]^@�j񿉶t���G
��RK�vMT����F��߳�z���䙪�3b�l�����2r	O��ZE����l�
&5���eFޔL!�(���:#�J���������*=-Ao�=���g��?>Uɋ���m�ez�����E�BϘ�+�{Q��p䟗0���MDPq2���Vϭ� ��N-�N�ᜧq��;��&��k�L��#�P]�����4Y�����I�W��-��-t���n\��֠?�ӂ��^�	�迆�%�
�f0秳��n7.D�R��&�!�⢂<�ڃ���g5��Fw���i(z�8��D�GC�U7;sm��ᯆo��b�#~!~�@��v��)���C�LF�n��w����͛���!dMVJC�A)ڵ���f���ž��@������$�
�������.[Q,��Z}��h�I�p�g���y���=���۷o��F	e         �   x�m�M��@F�է�"ݝ�g�+M��:��M�$&tڹ�ś����
�{��Za�� ׸ğ�-H.E(x(g 1��|����hgiO���Ɯ/��·��zrrM��0J&a�	f�~�}��̟��H����s�96�"+P�[�Ǒ�E��ʻ�_�ǧXB�$*E��Zm�(|p'�#��?���}�� �N���%���Κ��#� �	c��g_�         k  x�e�;r�0Dk�*����)a����(5�#��,h;E���[��p�<u;�Q�n<�C%7��~;r�
�L��zr�}J��t 2z�kd�@{�5p���@CES,��U�K��"�t�z���J�U-�V�_h'�6KD�Y�܎�3���te�Ű���ĬR
��O���NH��h�$f��i��vFi��2�ۃI����Q��|6���=iT��9h�弍��	G��W��E�����%�(/��BT!��)�t�gd@ ,$�5�&�p�w�#`�}y{%5���j�*i����u�r����M�⑯�5�8�yeE�ԭA��(m��&TlK`�+:Gx-f�꒭2ⱘ
n�_�M�� K��         =  x�}��V�@E��+(���H�	A2	0]6� �\��ү��ZXܻn���G�BfͦM��y $|���Q�gA�ko���9Cv�N�:�i��p�?��氎[{'DG�.���t�vbe|}!�1��t��y�vŭM�g�*�K�6�ݖe�1��VP�uIߔ����@O�+�Eй0ʇ�3�V��$r���bU7�GMF�p����Ƅ��'e�l�',-����A8/����A�8����[.$i��	���'}<�<�6-��2���-�"D��-�op8_T��t�g�6'�ļK]����{��}�u�            x������ � �     