From: Niels Borne <niels.borne@laposte.net>
Subject: Re: hardware limits
Date: Sat, 03 Jun 2006 16:47:16 +0200
Message-ID: <4481A0F4.5090702@laposte.net>
References: <44795327.5000809@laposte.net>
	<20060529144727.GA10393@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060529144727.GA10393@dominikbrodowski.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk


Hi,

Thanks for your answer. More questions below :


Dominik Brodowski a =E9crit :
> Hi,
>=20
> On Sun, May 28, 2006 at 09:37:11AM +0200, Niels Borne wrote:
>> I am working on a vaio laptop pcg-fr415b, using fc5 (see result of cat=20
>> /proc/cpuinfo above).
>> Since it is quite noisy I allowed cpuspeed at startup and this improved =

>> the situation a little bit.
>> Still cpufreq-info (see details above -in french, but you can guess) giv=
es
>> hardware limits : 2.10 GHz - 2.80 GHz
>> Is there any hope to go below 2.10 GHz and if yes, how ?
>=20
> Unfortunately no -- there's a bug in the hardware which causes problems if
> the frequency is lower than 2 GHz.=20

Which hardware exactly ? It this related to the N60 errata ?

Also, p4-clockmod doesn't save you all
> that much (if at all)=20

well it seems to improve somewhat

as it doesn't do CPU frequency and voltage scaling,

what do you mean ? my frequency is now most often 2.10 GHz, and was 2.80=20
GHz, so it does CPU frequency, doesn't it ?


so you shouldn't worry too much about this...


>=20
> 	Dominik

Niels
