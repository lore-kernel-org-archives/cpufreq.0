From: Ashley Pittman <ashley@quadrics.com>
Subject: Re: Patch to stop i386 longhaul from deadlocking the kernel
Date: Thu, 20 Nov 2003 13:24:04 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1069334644.26134.1358.camel@ashley>
References: <1068045570.23318.34.camel@ashley>
	<20031120124613.GA12049@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031120124613.GA12049@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Thu, 2003-11-20 at 12:46, Dave Jones wrote:
> On Wed, Nov 05, 2003 at 03:19:30PM +0000, Ashley Pittman wrote:
> 
>  > This patch stops the deadlock in the case where the speed of the fsb is
>  > undetected.  I've also made the guess function more vague so it can
>  > detect the correct speed for my cpu, it might need to be even more vague
>  > for other cpu's.
> 
> 0xbf seems bizarre. Something went wrong somewhere.
> Can you put some printk's in there, so I can see what values _guess()
> and guess_fsb() are being called with ?

The computer is at home today but it's one of the 800Mhz boards, the fsb
is 133, multiplier of 60.  The speed should therefore be 798 but cpu_khz
is reporting it as 800.  Then it's just a case of how many bits you need
to remove of before 798==800.  The result is that they both need to
equal 768.  I've attached a user-space program which demonstrates this
with output.

>  > I am still unable to change the CPU speed even with this patch however. 
> 
> You're not the first report I've had of this. I'm not sure what I broke.
> It was a case of 'fix for some, break others'.
> 
>  > longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v1 supported.
>  > longhaul: MinMult=3.0x MaxMult=6.0x
>  > longhaul: FSB: 0MHz Lowestspeed=0MHz Highestspeed=0MHz
>  > 
>  > At this point the whole system would lock solid.
> 
> Why it locks up is also odd.

I didn't get anywhere with that, I took the route of stopping the code
when a error condition was detected, returning -EFAULT avoided the
problem nicely.

Ashley,

optput:
ashley:cpufreq> ./a.out 
Kludge is 15 0xf
Speed is 800 0x320 (800 0x320)
Working... guess 66 maxmult 60 target 384 0x180
Working... guess 100 maxmult 60 target 592 0x250
Working... guess 133 maxmult 60 target 784 0x310
The answer is 0
Kludge is 191 0xbf
Speed is 768 0x300 (800 0x320)
Working... guess 66 maxmult 60 target 256 0x100
Working... guess 100 maxmult 60 target 576 0x240
Working... guess 133 maxmult 60 target 768 0x300
The second answer is 133
ashley:cpufreq> 


test.c:

int SPEEDKLUDGE = 0;
int cpu_khz = 800000;

static int _guess (int guess, int maxmult)
{
	int target;
	
	target = ((maxmult/10)*guess);
	if (maxmult%10 != 0)
		target += (guess/2);
	target &= ~SPEEDKLUDGE;
	printf("Working... guess %d maxmult %d target %d %#x\n",
	       guess,maxmult,target,target);
	return target;
}

static int guess_fsb(int maxmult)
{
	int speed = (cpu_khz/1000) & ~SPEEDKLUDGE;
	int i;
	int speeds[3] = { 66, 100, 133 };
	
	printf("Kludge is %d %#x\n",SPEEDKLUDGE,SPEEDKLUDGE);
	
	printf("Speed is %d %#x (%d %#x)\n",
	       speed,speed,
	       (cpu_khz/1000),(cpu_khz/1000));
	
	for (i=0; i<3; i++) {
		if (_guess(speeds[i],maxmult) == speed)
			return speeds[i];
	}
	return 0;
}

main () {
	SPEEDKLUDGE = 0xf;
	printf("The answer is %d\n",guess_fsb(60));
	SPEEDKLUDGE = 0xbf;
	printf("The second answer is %d\n",guess_fsb(60));
}
