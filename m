From: BARRE Francois <francois.barre@siemens.com>
Subject: RE: RE : VIA C3 M10k Nehemiah longhaul support in 2.6.x ?
Date: Tue, 9 Mar 2004 10:27:14 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <EFEF4C473088B847B64CD953D2A6A10401AD2444@sdso14a.par.siemens.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Doug Sutherland <wearable@cogeco.ca>
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

Hello all,

Bruno wrote
> The sysfs interface (or compatible much more likely) is not ported =
yet.

Do you mean in 2.6 ? In 2.6 it is 100% functionnal !

Well, anyway I guess I have to do some porting to 2.6.x., basing on the =
most
relevant 2.4 version (I think the most relevant is your link, Doug ; I =
was
successfully running it on 2.4 some weeks ago..).

I hope it will be of some help.=20

PS : Did anyone here manage to set cpu fan speed by hand ?

-----Message d'origine-----
De : Doug Sutherland [mailto:wearable@cogeco.ca]=20
Envoy=E9 : mardi 9 mars 2004 02:23
=C0 : BARRE Francois; 'Bruno Ducrot'; cpufreq@www.linux.org.uk
Objet : RE : VIA C3 M10k Nehemiah longhaul support in 2.6.x ?

Fran=E7ois wrote:

 > I just tried the current 2.6.3 cpufreq driver for my Nehemiah <snip>
 > With a tiny hack forcing the driver to support the nehemiah (switch
 > (c->x86_model)in longhaul_init() ), I obtain the same results as =
Bruno
 > (scaling from 6.5x to 7.5x).

Bruno doesn't have this hardware, I think you're referring to my test
results of his recent changes to the Nehemiah code. I indicated earlier
that the min multiplier for nehemiah should be 5x not 6.5x. I can run
mine at 133x5=3D665Mhz using this alternate (non-kernel) longhaul =
driver:

http://www3.sympatico.ca/howlettfamily/epia/longhaul-1.2.tar.gz

Bruno wrote:
 > BTW, does someone know if there are publically available data books
 > for this family of processors?

The author of the above driver said he used the VIA bios programming
guide to get the necessary info. I compared the cpufreq code with his
driver, and also the code on the via arena site. Here is some of the
things I discovered:

First, Bruno mentioned this:
 > Well, the only difference I see is something like that, in the one
 > provided by via:
 >    if (longhaul=3D=3D3)
 >       minmult =3D 30;
 >    else
 >       minmult =3D 50;
 > (this case have been merged via longhaul_version being '2' in the
 > current driver).

There are 4 versions of longhaul. At the top of the code on the VIA
site, the following is listed:

Marketing name     Codename         Longhaul Version /Features
Samuel/CyrixIII    C5A              v1: multipliers only
Samuel2/C3         C3E/C5B          v1: multipliers only
Ezra               C5C              v2: multipliers and voltage
Ezra-T             C5M/C5N          v3: multipliers, voltage & FSB

Note: Even though the comments do not mention Nehemiah and v4 longhaul,
there is code that says if x86_model =3D 9 (Nehemiah) set longhaul =3D =
4

Now looking at Andrew Howlett's longhaul driver, he expands more
on these longhaul versions:

Family    Model    Stepping    Core      Longhaul
   6         6         all      Samuel       1
   6         7          0       Samuel 2     1
   6         7         1-7      Samuel 2     2
   6         7         8-15     Ezra         2
   6         8          x       Ezra T       3
   6         9         0-1      Nehemiah     4a
   6         9         2->      Nehemiah     4b

So here we see two different v4 longhaul versions, and his helper
tables show different tables for longhaul4a and longhaul4b.

I printed out the helper tables for all three of these longhaul
drivers and compared them. This is what I found:

- The cpufreq tables match the code from the via arena site

- The longhaul 4 tables in the via code match andrew howlett's
   longhaul 4b tables. Seems that the via code does not have the
   longhaul 4a values.

- One minor difference between andrew's and via's nehemiah eblcr
   table: The via code list the last entry as 1111 (-1) reserved,
   while andrew's code lists it as 1111 (145) 14.5x. As mentioned
   earlier, the cpufreq tables match the via tables, so they
   share this difference.

- Andrew's longhaul 4a table, which is not in any other driver
   (since both the via and cpufreq tables match his longhaul 4b),
   lists 0001 (-1) as reserved.

Although there are minor differences in the tables, that does
not account for my nehemiah (stepping 4) showing a min multiple
of 6.5 in cpufreq. Both other drivers correctly set it to 5x.

In andrew's driver I find this interesting tidbit:
/* In theory the minimum multiplier should be specified in
  * MSR_VIA_LONGHAUL with the MinMHZBR and MinMHZBR4 bits. But
  * in reality that doesn't seem to work. The following switch
  * statement has been developed by trial and error. So far
  * tobbe has reported that his 6.9.1 freezes up at 3.0 and 3.5

   switch (longhaul_state->cpu_model) {
   case 9:
     minmult =3D 40;
     break;
   default:
     minmult =3D 30;
     break;

Interesting how the other driver (on via arena site) does:

   if (longhaul=3D=3D3)
     minmult =3D 30;
   else
     minmult =3D 50;

Note: My CPU is a Nehemiah (model 9) stepping 4, so it should
be longhaul v4b according to andrew's comments. This CPU gets
a minimum multipler of 5x in both of these drivers (133x5=3D650Mhz),
while in the cpufreq driver it gets 6x (133x6.5=3D864.5Mhz).

This makes sense for the via code, since the if statement above
would yield 50, but I'm confused about andrew's code, minmult
would be 40 yet it ends up being 5x (perhaps there is other code
that does some additional calculation).

For now, I am sticking with andrew's driver, because at least
it lets me clock down to 5x. However his driver won't load on
kernel 2.6, so I sure would like to see the cpufreq code for
nehemiah fixed.

One additional note: as I said earlier, I saw a table of the
multiplier values for all VIA CPUs somewhere on the net, and
it did list Nehemiah as minimal mult of 5x. I tried to find
the site again and couldn't find it. However, this page also
shows the Nehemiah Min CPU Mult as 5x

http://www.viaarena.com/?PageID=3D375

Perhaps I will try to get the BIOS Programming Guide from VIA.

Bruno, could you possibly add the bit of code that sets the
min multiplier to 5x for nehemiah (cpuid case 9)?

Whether you want to add the longhaul v4a and v4b tables per
andrew's driver, I guess that's up to you. He stated that he
used the BIOS programmer's guide, so ...

   -- Doug
