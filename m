From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - There are limits
Date: Mon, 03 Jul 2006 20:37:47 +0200
Message-ID: <44A963FB.7040302@interia.pl>
References: <44A8A894.7020907@interia.pl> <20060703141148.GK14292@redhat.com>
	<44A93F07.3020905@interia.pl> <20060703165220.GM14292@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060703165220.GM14292@redhat.com>
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

> [...]
> I wonder if this could be solved with something as trivial as..
> [...]

I just found this:
"The local APIC is enabled at boot-time and can be disabled by=20
clearing bit 11 of IA32_APIC_BASE_MSR (the CPU then receives its=20
interrupts directly from a 8259-compatible PIC."
So simple?

Rafa=B3


------------------------------------------------------------------------
Interaktywne mapy miast na http://map24.interia.pl
