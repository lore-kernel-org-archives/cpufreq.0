From: Clemens Orthacker <clemenso@sbox.tugraz.at>
Subject: Re: kernel: acpi-cpufreq: Transition failed
Date: Sat, 5 Feb 2005 09:25:11 +0100
Message-ID: <200502050925.11480.clemenso@sbox.tugraz.at>
References: <200502021158.26890.clemenso@sbox.tugraz.at>
	<200502041126.58413.clemenso@sbox.tugraz.at>
	<20050204202734.GA8030@dominikbrodowski.de>
Reply-To: clemenso@sbox.tugraz.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050204202734.GA8030@dominikbrodowski.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@lists.linux.org.uk

Am Freitag, 4. Februar 2005 21:27 schrieb Dominik Brodowski:

> Did it work correctly when you used earlier kernels than 2.6.10? Even if
> using powernowd?

Yes. At least there were no error messages. (2.6.9)

> If speedstep-ich works, you should use that module instead --

I don't have a Intel chipset, so I thought I should use acpi-cpufreq.

> other than 
> that, this doesn't look like a configuration problem. The BIOS tells us how
> the kernel should ask it for CPU frequency changes; the kernel does it, but
> then the BIOS simply reports "error". It might be that the BIOS does
> provide the kernel with wrong information on what the return value means --
> i.e. the kernel thinks it is an error, but in reality it isn't.
>
> What chipset does your notebook use (plain "lspci" output, please)?
>
Sorry, I forgot to add this in the first mail.

0000:00:00.0 Host bridge: ALi Corporation M1671 Super P4 Northbridge 
[AGP4X,PCI and SDR/DDR] (rev 02)
0000:00:01.0 PCI bridge: ALi Corporation PCI to AGP Controller
0000:00:06.0 Multimedia audio controller: ALi Corporation M5451 PCI AC-Link 
Controller Audio Device (rev 02)
0000:00:07.0 ISA bridge: ALi Corporation M1533 PCI to ISA Bridge [Aladdin IV]
0000:00:08.0 Modem: ALi Corporation M5457 AC'97 Modem Controller
0000:00:0a.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
RTL-8139/8139C/8139C+ (rev 10)
0000:00:0b.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394 Host 
Controller (rev 46)
0000:00:0c.0 Network controller: Intersil Corporation Prism 2.5 Wavelan 
chipset (rev 01)
0000:00:0d.0 USB Controller: NEC Corporation USB (rev 41)
0000:00:0d.1 USB Controller: NEC Corporation USB (rev 41)
0000:00:0d.2 USB Controller: NEC Corporation USB 2.0 (rev 02)
0000:00:10.0 IDE interface: ALi Corporation M5229 IDE (rev c4)
0000:00:11.0 Bridge: ALi Corporation M7101 Power Management Controller [PMU]
0000:00:13.0 CardBus bridge: O2 Micro, Inc. OZ6912 Cardbus Controller
0000:01:00.0 VGA compatible controller: nVidia Corporation NV11 [GeForce2 Go] 
(rev b2)


-- 
| Clemens Orthacker
| e-mail: ClemensO@sbox.TUGraz.at
| phone: +43/650/6693393
