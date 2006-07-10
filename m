From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Use information from Longhaul
Date: Mon, 10 Jul 2006 10:28:18 -0400
Message-ID: <20060710142818.GA7030@redhat.com>
References: <44B0D22D.2030805@interia.pl> <20060709190027.GB10044@redhat.com>
	<44B1624A.2040000@interia.pl> <20060709210027.GC10044@redhat.com>
	<44B1E964.3020001@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44B1E964.3020001@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jul 10, 2006 at 07:45:08AM +0200, Rafa=C5=82 Bilski wrote:
 > >  > I don't know how to explain this properly in English. I will use ex=
ample.
 > >  > This is from my Nehemiah:
 > >  > min f =3D 433MHz =3D 6.5 * 66MHz
 > >  > max f =3D 999MHz =3D 7.5 * 133MHz
 > >  > but this is Nehemiah "C" and it is working downto 4.0 multiplier.
 > >  >=20
 > >  > This is Ezra that I have found in Google (output from Your program):
 > >  > min f =3D 300MHz =3D 3.0 * 100MHz
 > >  > max f =3D 864MHz =3D 6.5 * 133MHz
 > >=20
 > > But this is only true IFF we scale the FSB, which we don't.
 > > The above scenarios will not happen for as long as that is true.
 > >=20
 >=20
 > I'm starting to thinking that printing this information to user
 > isn't good idea.=20

Leaving such printk's as 'dprintk's is the best way forward.
That way they only get displayed if someone boots up with cpufreq.debug=3D

		Dave

--=20
http://www.codemonkey.org.uk
