From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 10:01:39 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040114090138.GB260@elf.ucw.cz>
References: <99F2150714F93F448942F9A9F112634C080EF39F@txexmtae.amd.com>
	<20040114034237.GT14674@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040114034237.GT14674@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, paul.devriendt@amd.com, cpufreq@www.linux.org.uk, linux@brodo.de, linux-kernel@vger.kernel.org, mark.langsdorf@amd.com

Hi!

>  > >> Dave had a good idea of a minimal ACPI parser for trying to retrieve the
>  > >> table of p-states from an ACPI BIOS without needing the full AML interpreter.
>  > >> I will see if I can get that to work in powernow-k8-acpi 
>  > >  
>  > > If done properly, that parsing code could be shared by the K7 
>  > > driver too.
>  > 
>  > Agreed. Function in a header file? Don't want the drivers attempting to
>  > call each other at runtime.
> 
> Works for me, or shove it out into its own .c file, and have both drivers link against it.

Would acpi parsing be usefull for non-amd systems, too?
								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
