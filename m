From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: cpufreq and 2.4.
Date: Mon, 18 Aug 2003 11:57:29 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030818115729.A31111@flint.arm.linux.org.uk>
References: <20030817153510.GA2361@brodo.de> <3F40AEC8.3060306@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F40AEC8.3060306@basmevissen.nl>; from ml@basmevissen.nl on Mon, Aug 18, 2003 at 12:47:36PM +0200
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

On Mon, Aug 18, 2003 at 12:47:36PM +0200, Bas Mevissen wrote:
> Dominik Brodowski wrote:
> > A) Previous 2.4. cpufreq included in parts of kernel
> > There _is_ already some cpufreq code in the 2.4. kernel. In arch/arm there
> > are ARM-cpufreq drivers which use the previous 2.4. stable series of cpufreq
> > which nobody uses on x86 any more [I guess]. In 2.6., the ARM cpufreq
> > drivers are updated. However, this isn't included in the current 2.4. 
> > backports.
> 
> I think that the 2.4 backports should be as complete as possible. 
> Currently, ARM-linux is on 2.4. But when 2.6 is out, they are very 
> likely to go for 2.6 ASAP as power management is a lot better integrated 
> in 2.6.

I don't think so.  PM is still developing in 2.6, and there's a fair
amount of work that needs to be done in that area.  I'm not aware of
anyone looking into this topic on "interesting ARM platforms" at
present - the main focus today continues to be 2.4-based kernels.

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
