From: Johan Bilien <jobi@via.ecp.fr>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 16:11:42 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813141141.GB28615@via.ecp.fr>
References: <20030813135836.GA28615@via.ecp.fr> <20030813140443.GE1372@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030813140443.GE1372@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Wed, Aug 13, 2003, Ducrot Bruno wrote:
> > I'm trying to run cpufreq on my IBM laptop Thinkpad T22, with a Pentium
> > 3 900 (with speedstep). I have a linux 2.6.0-test3 kernel, and have
> > speedstep-ich.ko and speedstep-lib.ko compiled as modules. When I insmod
> > speedstep-lib, nothing happens. When I insmod speedstep-ich, I get:
> > 
> > FATAL: Error inserting speedstep_ich
> > (/lib/modules/2.6.0-test3/kernel/arch/i386/kernel/cpu/cpufreq/\
> > speedstep-ich.ko): No such device
> 
> could you post the output of
> lspci -vx -s0:
> please?

13/08 16:08 ~% lspci -vx -s0
00:00.0 Host bridge: Intel Corp. 440BX/ZX/DX - 82443BX/ZX/DX Host bridge
(rev 03)
        Flags: bus master, medium devsel, latency 64
        Memory at f8000000 (32-bit, prefetchable) [size=64M]
        Capabilities: <available only to root>
00: 86 80 90 71 06 01 10 22 03 00 00 06 00 40 00 00
10: 08 00 00 f8 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 a0 00 00 00 00 00 00 00 00 00 00 00

01:00.0 VGA compatible controller: S3 Inc. 86C270-294 Savage/IX-MV (rev
13) (prog-if 00 [VGA])
        Subsystem: IBM ThinkPad T20
        Flags: bus master, 66Mhz, medium devsel, latency 64, IRQ 11
        Memory at f0000000 (32-bit, non-prefetchable) [size=128M]
        Expansion ROM at <unassigned> [disabled] [size=64K]
        Capabilities: <available only to root>
00: 33 53 12 8c 07 00 30 02 13 00 00 03 08 40 00 00
10: 00 00 00 f0 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 14 10 7f 01
30: 00 00 00 00 dc 00 00 00 00 00 00 00 0b 01 04 ff

Thank you for your prompt reply,
-- 
Jobi
