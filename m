From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: 2.6.11: USB broken on nforce4, ipv6 still broken, centrino speedstep
 even more broken than in 2.6.10
Date: Thu, 24 Mar 2005 15:33:52 -0800
Message-ID: <42434E60.1060209@goop.org>
References: <20050311202122.GA13205@fefe.de> <20050311173517.7fe95918.akpm@osdl.org> <1110599659.12485.279.camel@localhost.localdomain> <20050321163225.4af1c169.akpm@osdl.org> <1111454454.6633.5.camel@linux.site> <20050322222943.GA10442@codeblau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050322222943.GA10442@codeblau.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Felix von Leitner <felix-linuxkernel@fefe.de>
Cc: Adam Belay <abelay@novell.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, cpufreq@ZenII.linux.org.uk

Felix von Leitner wrote:

>>ACPI is the preferred (and only standardized) method of controlling cpu
>>throttling on x86 systems.
>>    
>>
>
>  1. I don't trust ACPI
>  2. my battery runs out quicker with ACPI compared to cpufreq
>
>I _really_ _really_ don't want ACPI.  No, really not.  This is no idle
>decision.  My current notebook is the only hardware I have ever seen
>enabling ACPI not completely break Linux.  Of all my 10+ machines,
>including my other 3 ones that are actually in use.
>  
>
Unfortunately, the Dothans *REQUIRE* some degree of ACPI support; the
speedfreq-centrino needs to extract a table from ACPI to know what are
valid operating (voltage/frequency) points to use for the CPU.  The
patch you're using is definitely wrong in principle, though if it works
for you in practice then by all means use it.

The problem is that there are 4 different voltage grades of Dothan -
VID#A to VID#D - and there doesn't appear to be a way to tell what grade
a CPU is from software at runtime; this is a problem because there's no
one set of voltages you can use across all 4 grades (they have
non-overlapping voltage limits).  It's unknown whether running a Dothan
out of voltage spec will cause reliability problems or damage.

    J
