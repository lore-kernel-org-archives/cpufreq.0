From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Pentium III Coppermine and 440BX/ZX/DX
Date: Tue, 17 Feb 2004 10:54:11 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040217095411.GV13262@poupinou.org>
References: <20040217005504.GA809@acheron.utfors.se>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040217005504.GA809@acheron.utfors.se>
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

On Tue, Feb 17, 2004 at 01:55:04AM +0100, Jesper Anderson wrote:
> I have a Gateway Solo 3450 laptop, which is a PIII 750 MHz with a
> PIIX4 chipset. I'm trying to get both ACPI and cpufreq to work on it,
> with very little luck so far. The ACPI is its own kettel of fish, I
> suspect the BIOS might be rather broken (but then, which isn't?), but
> I was hoping the cpufreq issue could at least be somewhat easy to
> solve.
> 
> Unfortunately I'm a bit unclear on just what I need to do to get
> cpufreq running on this system. I tried modprobing speedstep-smi (from
> kernel 2.6.2 with mm1), and it gives no errors - but neither does it
> give me anything to go on in /sys or /proc. speedstep-ich doesn't load
> at all. I tried the patch posted previously on the mailing list (that
> removes a few bits of the PIII check), but that didn't make any
> difference.
> 
> I'm a bit at a loss as to where to go from here. speedstep-detect
> doesn't show any different output on battery or AC power, can that be
> a problem?
> 
> Output of speedstep-detect is attached.
> 
> Thanks in advance,
> 
> Jesper
> 
> 
> # ./speedstep-detect
> dmi_scan: return:
> DMI present.
> 31 structures occupying 1004 bytes.
> DMI table at 0x000D3010.
> BIOS Vendor: Gateway
> BIOS Version: 28.06.04
> BIOS Release: 03/14/2002
> System Vendor: Gateway
> Product Name: Solo3450
> Version: Rev 1.0
> Board Vendor: Gateway
> Board Name: Solo3450
> Board Version: Rev 1.0
> Trying Intel's int15 GSIC:
> BIOS support GSIC call:
>         signature: GSIC
>         command port = 0x00b2
>         command =      0x0080
>         event port =   0x000000b3
>         flags =        0x07d00100


There is good chance that it work, but I think that you need to pass the
smi_cmd=0x82 to speedstep-smi:

modprobe speedstep-smi smi_cmd=0x82

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
