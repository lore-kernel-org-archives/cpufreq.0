From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Sat, 19 Jun 2004 12:44:56 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040619104456.GA7689@dominikbrodowski.de>
References: <20040618185103.GA14909@buici.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040618185103.GA14909@buici.com>
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
To: Marc Singer <elf@buici.com>
Cc: cpufreq@www.linux.org.uk

Hi,

It looks like there's either a problem in the ACPI tables. So I'd like to
dump the relevant parts of the ACPI tables -- so, please, 
could you put this file

http://www.brodo.de/patches/2004-04-06/cpufreq-acpi_pdump.c

into the directory [assuming you're running a 64bit kernel]

arch/x86_64/kernel/cpufreq/ in the linux kernel sources,
add the line

obj-m += cpufreq-acpi_pdump.o

to the file "Makefile" in this directory,

re-build the kernel and modules, and then 

modprobe cpufreq-acpi_pdump

and send the dmesg to me?

Thanks,
	Dominik

On Fri, Jun 18, 2004 at 11:51:03AM -0700, Marc Singer wrote:
> Below is the dmesg output from the powernow driver. I'd be glad to
> patch the driver to fix&test if you can give me some indication as to
> where to look for the trouble.
