From: Ashley Pittman <ashley@quadrics.com>
Subject: Re: Patch to stop i386 longhaul from deadlocking the kernel
Date: Thu, 20 Nov 2003 14:12:57 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1069337577.26134.1366.camel@ashley>
References: <1068045570.23318.34.camel@ashley>
	<20031120124613.GA12049@redhat.com>
	<1069334644.26134.1358.camel@ashley>
	<20031120134012.GG5653@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031120134012.GG5653@redhat.com>
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

On Thu, 2003-11-20 at 13:40, Dave Jones wrote:
> On Thu, Nov 20, 2003 at 01:24:04PM +0000, Ashley Pittman wrote:
>  > The computer is at home today but it's one of the 800Mhz boards, the fsb
>  > is 133, multiplier of 60.  The speed should therefore be 798 but cpu_khz
>  > is reporting it as 800.  Then it's just a case of how many bits you need
>  > to remove of before 798==800.  The result is that they both need to
>  > equal 768.  I've attached a user-space program which demonstrates this
>  > with output.
> 
> Right, so the anding is catching the case of overflow, but neglecting
> underflow. It seems to do the right thing if I change guess_fsb to do this..

> I need to think about this some more. I'm not entirely comfortable with
> that, it looks somewhat fragile, though I can see why it works.

Isn't the correct thing to do to increase the speed before anding it? 
That way it will always end up in the right bin.  The following code
works for me and does feel right.  A value of 0x7 is all thats needed to
get the right answer on my machine in this case.

static int _guess (int guess, int maxmult)
{
	int target;
	
	target = ((maxmult/10)*guess);
	if (maxmult%10 != 0)
		target += (guess/2);
	target += SPEEDKLUDGE/2;
	target &= ~SPEEDKLUDGE;
	printf("Working... guess %d maxmult %d target %d %#x\n",
	       guess,maxmult,target,target);
	return target;
}

static int guess_fsb(int maxmult)
{
	int speed = (cpu_khz/1000);
	int i;
	int speeds[3] = { 66, 100, 133 };
	
	speed += SPEEDKLUDGE/2;
	speed &= ~SPEEDKLUDGE;
	
	printf("Kludge is %d %#x\n",(int)SPEEDKLUDGE,(int)SPEEDKLUDGE);
	
	printf("Speed is %d %#x (%d %#x)\n",
	       speed,speed,
	       (cpu_khz/1000),(cpu_khz/1000));
	
	for (i=0; i<3; i++) {
		if (_guess(speeds[i],maxmult) == speed)
			return speeds[i];
	}
	return 0;
}
