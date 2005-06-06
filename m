From: Ramkumar R <andyetitmoves@gmail.com>
Subject: Re: Temporary freezes in AMD Sempron 2800+
Date: Tue, 7 Jun 2005 00:53:50 +0530
Message-ID: <9a9bfc170506061223354456e6@mail.gmail.com>
References: <9a9bfc1705060607494838bc6c@mail.gmail.com>
	<200506061906.16327.mpytasz@pai.net.pl>
	<9a9bfc170506061021620e487a@mail.gmail.com>
	<200506061956.16644.mpytasz@posejdon.wpk.p.lodz.pl>
	<9a9bfc1705060611114a1f2596@mail.gmail.com>
Reply-To: Ramkumar R <andyetitmoves@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9a9bfc1705060611114a1f2596@mail.gmail.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-2?Q?Micha=B3_Pytasz?= <mpytasz@posejdon.wpk.p.lodz.pl>, cpufreq@lists.linux.org.uk

it worked at last! thanx a lot michal for your kernel config
file...the culprit was the ACPI Processor P-States driver
(X86_ACPI_CPUFREQ)....not that i need it (i dunno why i had it in the
first place :) )...but still, is this a bug ? (michal, may be if you
could confirm this by making it a module and loading it)...

yeah, one more question remains...does sempron have only 2 frequency
levels...that's what dmesg and the sys file seem to indicate....though
i've read that amd processors have quite a few speed levels (is that
only for the athlon series ?)

Ramkumar.
--=20
The day Microsoft makes something that doesn't suck
is probably the day they start making vacuum cleaners.
                                               -Ernst Jan Plugge
