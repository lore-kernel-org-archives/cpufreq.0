From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 5/8] p4_clockmod: detect speed without relying on
	cpu_khz or user input
Date: Fri, 21 Nov 2003 02:26:13 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031121022613.GA15356@redhat.com>
References: <20031119183228.GF20576@brodo.de>
	<20031119190946.GB5653@redhat.com> <20031120183335.GB4425@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031120183335.GB4425@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Thu, Nov 20, 2003 at 07:33:35PM +0100, Dominik Brodowski wrote:
 > On Wed, Nov 19, 2003 at 07:09:46PM +0000, Dave Jones wrote:
 > > 
 > > patch 4/8 introduced what seems to be the exact same code in the speedstep-lib.
 > > Perhaps it belongs in an fsb.o instead that they can both share ?
 > > I don't mind duplicating it twice in object code, but having two copies
 > > in the source seems a bit silly.
 > 
 > Usually, I agree to this topic. However, I don't want to create just another
 > file for just this function, and it doesn't belong to speedstep-lib either
 > as a plain p4 isn't a valid processor for speedstep-lib. So I'd prefer to
 > have this source code duplication as an exception here.

Your call. I'm just concerned with the maintainence effort as this
routine grows.

As a sidenote, this could be useful outside of cpufreq at some point too.
Alan tried adding 'overclocking detection' using these registers a while
back. It is very difficult to get correct however, so it never came to
anything.  If we took the "perfect is the enemy of 'good enough'" approach
and just did these checks for cpus we knew we do it correctly on, this
would become feasable to pull off for 2.7.

		Dave
