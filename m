From: Nebojsa Trpkovic <tnt@professor.ru>
Subject: Re: powernow-k7: changing of VID is posible, says tom...
Date: Sun, 03 Oct 2004 11:01:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <415FBFF7.2090905@professor.ru>
References: <415DBE12.6020104@professor.ru>	<20041002191205.7D0D040AA8@nathan.muc.de>	<415F38EE.5000406@professor.ru>
	<20041003064406.D818440AAB@nathan.muc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041003064406.D818440AAB@nathan.muc.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Harald Milz wrote:

>use modprobe. powernow-k7 has some dependencies. 
>
>  
>
Same story:

[root@beta tnt]# modprobe powernow-k7 mycpuid=0x6a0 myfsbspeed=200 
mymaxfid=0x00 mystartvid=0xb mynumpstates=5 
myfids=0x00,0x0a,0x06,0x04,0x12 myvids=0x0b,0x0d,0x13,0x13,0x13
FATAL: Error inserting powernow_k7 
(/lib/modules/2.6.8-dynfreq/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k7.ko): 
No such device
[root@beta tnt]# modprobe powernow-k7 mycpuid=0x7a0 myfsbspeed=200 
mymaxfid=0x00 mystartvid=0xb mynumpstates=5 
myfids=0x00,0x0a,0x06,0x04,0x12 myvids=0x0b,0x0d,0x13,0x13,0x13
FATAL: Error inserting powernow_k7 
(/lib/modules/2.6.8-dynfreq/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k7.ko): 
No such device

I guess that my CPU can not be recognised because it's modded Barton. I 
made it 'mobile' by connecting L5 bridge on it. But, in Window$ 
everything works fine and I'm able to change multiplier on the fly.
Maybe I just use wrong mycpuid, but I've tried 0x6a0 and 0x7a0... :(

Is there any way to force powernow to work without checking of CPU?
