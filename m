From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Wed, 11 Aug 2004 23:29:30 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040811212930.GA9710@dominikbrodowski.de>
References: <4114D272.6070808@versanet.de>
	<20040807131432.GA8934@dominikbrodowski.de>
	<4114E9C1.8070409@versanet.de>
	<20040808175726.GA15268@dominikbrodowski.de>
	<4116A003.600@versanet.de>
	<20040809204940.GA10802@dominikbrodowski.de>
	<4118FE2C.8080508@versanet.de>
	<20040811194246.GA13362@dominikbrodowski.de>
	<411A8191.9060805@gmx.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <411A8191.9060805@gmx.de>
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
To: Christian Heimanns <ch.heimanns@gmx.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>

This is sooo strange:

>     OperationRegion (MNVS, SystemMemory, 0x1FF7A000, 0x1000)
>     Field (MNVS, AnyAcc, Lock, Preserve)
>     {
...
>         Offset (0xF20), 
>         P0FQ,   16, 
>         P0PW,   16, 
>         P0CT,   16, 
>         P1FQ,   16, 
>         P1PW,   16, 
>         P1CT,   16, 
...

the frequency and "control" value which needs to be written to a BIOS port
so that a frequency transition occurs are saved in a "non-volatile storage",
and by executing the CPU-init method

>     Scope (_PR)
>     {
>         Processor (CPU0, 0x00, 0x00001010, 0x06)
>         {
>             Method (_INI, 0, NotSerialized)
>             {
>                 Store (\P0FQ, Index (DerefOf (Index (_PSS, 0x00)), 0x00))
>                 Store (\P0PW, Index (DerefOf (Index (_PSS, 0x00)), 0x01))
>                 Store (\P0CT, Index (DerefOf (Index (_PSS, 0x00)), 0x04))
>                 Store (\P1FQ, Index (DerefOf (Index (_PSS, 0x01)), 0x00))
>                 Store (\P1PW, Index (DerefOf (Index (_PSS, 0x01)), 0x01))
>                 Store (\P1CT, Index (DerefOf (Index (_PSS, 0x01)), 0x04))
>             }

they're saved in the appropriate fields inside the _PSS package:

>             Name (_PSS, Package (0x02)
>             {
>                 Package (0x06)
>                 {
>                     0x00, 
>                     0x00, 
>                     0x01F4, 
>                     0x00, 
>                     0x00, 
>                     0x00
>                 }, 
> 
>                 Package (0x06)
>                 {
>                     0x00, 
>                     0x00, 
>                     0x01F4, 
>                     0x00, 
>                     0x00, 
>                     0x01
>                 }
>             })
>         }
>     }
> 

... and I doubt that _either_ the values found in the non-volatile storage,
or the propagation of these values to _PSS is broken:

a) Does anybody know whether there a way to read out the current _PSS in a 
   different  OS?
b) What's the best method to directly access the non-volatile storage area
   mentioned above to read out the P0FQ to P1CT values?

Thanks,
	Dominik
