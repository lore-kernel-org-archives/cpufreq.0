From: Marc Singer <elf@buici.com>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Sat, 19 Jun 2004 08:55:54 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040619155554.GA32432@buici.com>
References: <20040618185103.GA14909@buici.com>
	<20040619104456.GA7689@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040619104456.GA7689@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Sat, Jun 19, 2004 at 12:44:56PM +0200, Dominik Brodowski wrote:
> Hi,
> 
> It looks like there's either a problem in the ACPI tables. So I'd like to
> dump the relevant parts of the ACPI tables -- so, please, 
> could you put this file
> 
> http://www.brodo.de/patches/2004-04-06/cpufreq-acpi_pdump.c
> 
> into the directory [assuming you're running a 64bit kernel]
> 
> arch/x86_64/kernel/cpufreq/ in the linux kernel sources,
> add the line
> 
> obj-m += cpufreq-acpi_pdump.o
> 
> to the file "Makefile" in this directory,
> 
> re-build the kernel and modules, and then 
> 
> modprobe cpufreq-acpi_pdump
> 
> and send the dmesg to me?

On rumination, I came to a similar conclusion.  I can do as you ask.
Is this the same as grabbing the dsdt from the /proc/acpi interface
and running it through Intel's decompiler?  That's where I've started
to go.
