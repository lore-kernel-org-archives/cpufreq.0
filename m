From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: cpufreq and 2.4.
Date: Mon, 18 Aug 2003 19:10:21 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030818191021.D1737@flint.arm.linux.org.uk>
References: <20030817153510.GA2361@brodo.de> <3F40AEC8.3060306@basmevissen.nl> <20030818115729.A31111@flint.arm.linux.org.uk> <3F40C301.1010101@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F40C301.1010101@basmevissen.nl>; from ml@basmevissen.nl on Mon, Aug 18, 2003 at 02:13:53PM +0200
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
To: Bas Mevissen <ml@basmevissen.nl>
Cc: Dominik Brodowski <linux@brodo.de>, cpufreq@www.linux.org.uk

On Mon, Aug 18, 2003 at 02:13:53PM +0200, Bas Mevissen wrote:
> Russell King wrote:
> > I don't think so.  PM is still developing in 2.6, and there's a fair
> > amount of work that needs to be done in that area.  I'm not aware of
> > anyone looking into this topic on "interesting ARM platforms" at
> > present - the main focus today continues to be 2.4-based kernels.
> 
> OK. What is better for ARM: what is in 2.4 now or a backport of what is 
> in 2.6 now? The answer to that question helps Dominik in finding out 
> what to do with the ARM stuff when backporting cpufreq from 2.6.

I've mentioned that people need to speak up about their usage of the
2.4 cpufreq API on the ARM kernel list, and pointed them to this thread.

If no one responds in a few days, feel free to update 2.4 to the 2.6 API.

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
