From: BARRE Francois <francois.barre@siemens.com>
Subject: RE : VIA C3 M10k Nehemiah longhaul support in 2.6.x ?
Date: Mon, 8 Mar 2004 11:44:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <EFEF4C473088B847B64CD953D2A6A104FE8229@sdso14a.par.siemens.fr>
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
To: 'Bruno Ducrot' <ducrot@poupinou.org>, Doug Sutherland <wearable@cogeco.ca>
Cc: cpufreq@www.linux.org.uk

Well, hello all,

	I just tried the current 2.6.3 cpufreq driver for my Nehemiah (here
is the /proc/cpuinfo :
processor       : 0
vendor_id       : CentaurHauls
cpu family      : 6
model           : 9
model name      : VIA Nehemiah
stepping        : 1
)

	With a tiny hack forcing the driver to support the nehemiah (switch
(c->x86_model)in longhaul_init() ), I obtain the same results as Bruno
(scaling from 6.5x to 7.5x). And this seems to work with the 2.6.x /sys
interface using a userspace governor.=20
	Anyway I had a larger variety of scaling ratios on 2.4.x... Should I
have to hack it by myself ? Where could we have specs of such things ?
=09
	I tried to force the minmult value in longhaul_get_ranges (), but,
well, it just froze the module which is now unloadable. Need a reboot =
for
further tests... Have you any relevant docs and/or links about =
supported
ratios ?

	And, what about voltage scaling ? Who tried ?
=09
	Best regards,

Fran=E7ois.

-> -----Message d'origine-----
-> De : Bruno Ducrot [mailto:ducrot@poupinou.org]=20
-> Envoy=E9 : mercredi 3 mars 2004 16:23
-> =C0 : Doug Sutherland
-> Cc : BARRE Francois; cpufreq@www.linux.org.uk
-> Objet : Re: VIA C3 M10k Nehemiah longhaul support in 2.6.x ?
->=20
->=20
-> On Wed, Mar 03, 2004 at 12:09:26AM -0500, Doug Sutherland wrote:
-> > Correction ... I meant to say 650Mhz (133 FSB x 5 mult =3D =
665000).
-> > This works on these other drivers. cpufreq uses 6.5x133=3D 864500
-> >=20
-> >=20
->=20
-> Well, the only difference I see is something like that, in the one
-> provided by via:
->=20
-> 		if (longhaul=3D=3D3)
-> 			minmult =3D 30;
-> 		else
-> 			minmult =3D 50;
->=20
-> (this case have been merged via longhaul_version being '2' in the
-> current driver).  So apparently it is needed to override it =
somehow..
->=20
-> But really I need to get spec in order to decide.
->=20
->=20
-> --=20
-> Bruno Ducrot
->=20
-> --  Which is worse:  ignorance or apathy?
-> --  Don't know.  Don't care.
->=20
