From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Re: speedstep-centrino does not load on an Intel(R) Pentium(R)
	M processor 1.70 GHz
Date: Mon, 2 Aug 2004 22:30:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040802203015.GC8265@dominikbrodowski.de>
References: <e4cb198704073119587d687f91@mail.gmail.com>
	<1091332584.9043.4.camel@localhost>
	<e4cb198704080108427e7a20b5@mail.gmail.com>
	<1091403320.9043.17.camel@localhost>
	<e4cb198704080118296f1168c4@mail.gmail.com>
	<1091422655.9043.22.camel@localhost>
	<e4cb198704080204577ba467ee@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <e4cb198704080204577ba467ee@mail.gmail.com>
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
To: Thomas Tuttle <thinkinginbinary@gmail.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, Aug 02, 2004 at 07:57:40AM -0400, Thomas Tuttle wrote:
> Are there any tests I can run to just display the tables or see if
> they can be read?

There's a test module at:
http://www.brodo.de/patches/2004-04-06/cpufreq-acpi_pdump.c

please put it in arch/i386/kernel/cpu/cpufreq/ ,
append arch/i386/kernel/cpu/cpufreq/Makefile
with the following line:
obj-m += cpufreq-acpi_pdump.o

re-compile, make modules_install, modprobe cpufreq-acpi_pdump
[it'll fail], and check for the entries in dmesg.

Also, please post a /proc/cpuinfo

Thanks,

	Dominik
