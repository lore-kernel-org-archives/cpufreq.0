From: mark.langsdorf@amd.com
Subject: RE: powernow-k8 patch
Date: Thu, 19 Aug 2004 14:26:18 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A84310F330@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: ajp@aripollak.com, cpufreq@www.linux.org.uk

>  > No.  Your problem is caused by a malformed PST table
>  > that has too many "low" frequency entries and by a
>  > PSB header that isn't the correct revision (1.4).
>  > Complain to your BIOS vendor.  Tell them that their
>  > BIOS does not support PN! on Win2K.
>
> That's interesting, since IIRC AMD distributed a similar MSI 
> motherboard as a demo/reference. Maybe there's some obscure
> BIOS setting I'm missing.

No comment.
 
>  > I'm curious as to why it doesn't work under ACPI.
>  > Can you instantiate the ACPI version and give me the
>  > debug messages?

> I'm also wondering why powernow-k8 doesn't fallback to retrieving 
> information from ACPI, which is what the documentation says it's 
> supposed to do.
 
> Not sure if this is what you want, but here's the ACPI 
> debugging stuff 

Actually, I meant the powernow-k8 information.  If it failed
to load, it should give some reason why.

> and after I try to load the acpi module:
> ACPI: Processor [CPU1] (supports C1)
> acpi_processor_perf-0301 [30] acpi_cpufreq_cpu_init : Unsupported 
> address space [127, 127]

It looks like there's something wrong with the ACPI module,
but I don't know what that means.

-Mark Langsdorf
AMD, Inc.
