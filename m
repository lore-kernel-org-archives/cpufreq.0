From: Dave Jones <davej@redhat.com>
Subject: Re: Patch to stop i386 longhaul from deadlocking the kernel
Date: Thu, 20 Nov 2003 13:40:12 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031120134012.GG5653@redhat.com>
References: <1068045570.23318.34.camel@ashley>
	<20031120124613.GA12049@redhat.com>
	<1069334644.26134.1358.camel@ashley>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1069334644.26134.1358.camel@ashley>
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
Content-Transfer-Encoding: 7bit
To: Ashley Pittman <ashley@quadrics.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Thu, Nov 20, 2003 at 01:24:04PM +0000, Ashley Pittman wrote:
 > The computer is at home today but it's one of the 800Mhz boards, the fsb
 > is 133, multiplier of 60.  The speed should therefore be 798 but cpu_khz
 > is reporting it as 800.  Then it's just a case of how many bits you need
 > to remove of before 798==800.  The result is that they both need to
 > equal 768.  I've attached a user-space program which demonstrates this
 > with output.

Right, so the anding is catching the case of overflow, but neglecting
underflow. It seems to do the right thing if I change guess_fsb to do this..

    for (i=0; i<3; i++) {
        ret = _guess(speeds[i],maxmult);
        if (ret == speed)
            return speeds[i];
        if (ret < speed) {
            if ((ret+16) == speed)
                return speeds[i];
        }
    }
    return 0;
}

I need to think about this some more. I'm not entirely comfortable with
that, it looks somewhat fragile, though I can see why it works.
133 * 6 = 798
798 & ~0xf = 784
784 + 16 = 800

I wonder how well this kludge works for other frequencies.

		Dave
