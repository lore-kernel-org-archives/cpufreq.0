From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Kernel 2.6.7 speedstep-piix4 on vaio
Date: Thu, 29 Jul 2004 23:04:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040729210413.GA7782@dominikbrodowski.de>
References: <43210.141.228.156.225.1091110800.squirrel@141.228.156.225>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <43210.141.228.156.225.1091110800.squirrel@141.228.156.225>
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
To: Ivor Hewitt <ivor@ivor.org>
Cc: cpufreq@www.linux.org.uk

Hi,

On Thu, Jul 29, 2004 at 03:20:00PM +0100, Ivor Hewitt wrote:
> Hi,
> 
> Firstly should the speedstep-smi driver be able to work on a Vaio Z600TEK
> (Coppermine P3, 440BX chipset)?
Possibly.

> Given that I now have the piix driver working, should it be possible to make
> the smi driver work? i.e. is the smi just a better way of doing the same thing
> and anything that the old driver did should be possible in the new one?

No, the SMI driver does things differently. the -piix4 driver changes an
output signal of the southbridge which might or might not be connected to
the appropriate "intel speedstep logic" to switch speeds. the -smi driver
tries to talk to the BIOS which knows how to switch speeds, but sometimes
the BIOS doesn't understand us, as it only understands an undocumented
language [== undocumented values]...

Therefore, the speedstep-smi driver contains a few tweaks which modify the
"language" a bit: have you tried passing the module options
"smi_port=0xb2 smi_cmd=0x82" yet? On several systems, the smi_cmd is set
wrongly by default.

> PS Is there a searchable archive of this list?
Possibly @ gmane, but I don't know how far back that archive goes...

	Dominik
