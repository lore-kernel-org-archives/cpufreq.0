From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Mon, 21 Jun 2004 22:26:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040621202601.GA8064@dominikbrodowski.de>
References: <20040618185103.GA14909@buici.com>
	<20040619104456.GA7689@dominikbrodowski.de>
	<20040619155554.GA32432@buici.com>
	<20040618185103.GA14909@buici.com>
	<20040619104456.GA7689@dominikbrodowski.de>
	<20040619163631.GA1369@buici.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040619155554.GA32432@buici.com>
	<20040619163631.GA1369@buici.com>
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

On Sat, Jun 19, 2004 at 09:36:31AM -0700, Marc Singer wrote:
> It complains of a device not being present and leaves this in the
> dmesg log:
> 
> 
> number of states: 10
> acpi_pdump: P0: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P1: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P2: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P3: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P4: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P5: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P6: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P7: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P8: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> acpi_pdump: P9: 161061273 MHz, 629145 mW, 10066329 uS s:0x99999999 c:0x99999999
> control_register:
> 130 12 127 0 0 0 0
> status_register:
> 130 12 127 0 0 0 0
> 
> Is this really helpful?
Partly. It shows the values received by the powernow-k8 driver are
_completely_ bogus. A standard questions: have you tried a BIOS update?

> On rumination, I came to a similar conclusion.  I can do as you ask.
> Is this the same as grabbing the dsdt from the /proc/acpi interface
> and running it through Intel's decompiler?  That's where I've started
> to go.

Not really -- acpi_pdump dumps what's received by the powernow-k8 driver
from the ACPI subsystem, while decompiling /proc/acpi/dsdt prints out what's
really there in the ACPI tables. In your case, it might indeed be
interesting whether a more appropriate P-States part of the DSDT is
contained somewhere, which is not initialized properly. Could you
disassemble the DSDT, please, and check for _PSS entries (grep -20 _PSS)?

Thanks,
	Dominik
