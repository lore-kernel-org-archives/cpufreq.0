From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Only for "Powersaver"
Date: Thu, 13 Jul 2006 08:59:24 +0200
Message-ID: <44B5EF4C.1000906@interia.pl>
References: <44B5E0DD.9090109@interia.pl> <20060713062723.GB12807@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060713062723.GB12807@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

> It's really a BIOS failing. The CPU cares nothing about how it's driven,
> but if the DSDT lacks methods to do anything interesting, nothing happens.
>=20

No it isn't. I have checked FADT and DSDT and everything is OK. David spend
last 2 days checking changes in code that I send him. ACPI C3 is working on
EPIA 800. It really don't work for BCR2 MSR. Frequency is ONLY changed on=20
"halt" instruction. NEVER on ACPI C3. Maybe it works on lower ACPI states,
but if I understand ACPI spec correcly only C3 state is good for this.
Worst part is that this is mentioned in documentation: AUTOHALT only.
Information about Longhaul is stripped from later datasheets. Probably=20
designers from Centaur add support for ACPI later. I didn't know that=20
AUTOHALT don't mean ACPI C3 capable. There is SLEEP signal and probably
this signal is used to put processor in C3 state.

Sorry. I'm still learning.
Rafa=B3


--------------------------------------------------------------------
12 000 SMS-ow gratis! Promocja na http://link.interia.pl/f1971
