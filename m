From: Marc Singer <elf@buici.com>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Tue, 22 Jun 2004 10:59:05 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040622175905.GA17408@buici.com>
References: <20040618185103.GA14909@buici.com>
	<20040619104456.GA7689@dominikbrodowski.de>
	<20040619155554.GA32432@buici.com>
	<20040618185103.GA14909@buici.com>
	<20040619104456.GA7689@dominikbrodowski.de>
	<20040619163631.GA1369@buici.com>
	<20040621202601.GA8064@dominikbrodowski.de>
	<20040621214236.GA3858@buici.com>
	<20040622171103.GB8111@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040622171103.GB8111@dominikbrodowski.de>
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

On Tue, Jun 22, 2004 at 07:11:03PM +0200, Dominik Brodowski wrote:
> Also, are there any entries in the BIOS you can toggle which might be
> related to "Cool&Quiet", "PnP-capable OS", ...?

Bingo.  There is a Cool&Quiet enable option.  The dump module now
produces this:

    ACPI: Processor [CPU1] (supports C1, 16 throttling states)
    number of states: 10
    acpi_pdump: P0: 2000 MHz, 89000 mW, 125 uS s:0x8c c:0xa020288c
    acpi_pdump: P1: 1800 MHz, 66000 mW, 125 uS s:0x18a c:0xa020298a
    acpi_pdump: P2: 1800 MHz, 66000 mW, 125 uS s:0x18a c:0xa020298a
    acpi_pdump: P3: 1800 MHz, 66000 mW, 125 uS s:0x18a c:0xa020298a
    acpi_pdump: P4: 1800 MHz, 66000 mW, 125 uS s:0x18a c:0xa020298a
    acpi_pdump: P5: 800 MHz, 35000 mW, 125 uS s:0x280 c:0xa0202a80
    acpi_pdump: P6: 800 MHz, 35000 mW, 125 uS s:0x280 c:0xa0202a80
    acpi_pdump: P7: 800 MHz, 35000 mW, 125 uS s:0x280 c:0xa0202a80
    acpi_pdump: P8: 800 MHz, 35000 mW, 125 uS s:0x280 c:0xa0202a80
    acpi_pdump: P9: 800 MHz, 35000 mW, 125 uS s:0x280 c:0xa0202a80
    control_register:
    130 12 127 0 0 0 0
    status_register:
    130 12 127 0 0 0 0

And the powernow-p8 driver loads.

Perhaps this is an addition to the FAQ:

 Q609: AMD Cool&Quiet CPU won't load the powernow-k? driver.  Why?

 A609: The powernow driver gets it's information about processor
       states from the BIOS's reported ACPI control data.  If the
       powernow driver won't load it may be because Cool&Quiet hasn't
       been enabled in the BIOS.  Make sure that BIOS settings for a
       PowerNow or a Cool&Quiet option are enabled.

Or, maybe the driver should output a kernel message about BIOS
settings.

Cheers.
