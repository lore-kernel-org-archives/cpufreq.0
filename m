From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: cpufreq and 2.4.
Date: Mon, 18 Aug 2003 12:47:36 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F40AEC8.3060306@basmevissen.nl>
References: <20030817153510.GA2361@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030817153510.GA2361@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

> A) Previous 2.4. cpufreq included in parts of kernel
> There _is_ already some cpufreq code in the 2.4. kernel. In arch/arm there
> are ARM-cpufreq drivers which use the previous 2.4. stable series of cpufreq
> which nobody uses on x86 any more [I guess]. In 2.6., the ARM cpufreq
> drivers are updated. However, this isn't included in the current 2.4. 
> backports.
> 

I think that the 2.4 backports should be as complete as possible. 
Currently, ARM-linux is on 2.4. But when 2.6 is out, they are very 
likely to go for 2.6 ASAP as power management is a lot better integrated 
in 2.6.

> B) Difficult-to-understand cpufreq user interfaces
> The /proc/cpufreq and /proc/sys/cpu interfaces are difficult to understand
> and already deprecated in 2.6. Do we really want them to be added to a
> stable kernel release?
> 

Well, what then? There is no sysfs in 2.4, so we need something else to 
control the beast :-)

How feasable is it to "port" the sysfs _interface_ to /proc? It would 
simplicate matters for users, cpufreqd and documentation as they only 
needs to change the "working directory" for 2.4.

(Because sysfs is something completely different than /proc, it would 
mean writing new code. But as 2.4 will be in use for a couple of years, 
I think it is worth the trouble.)

Regards,

Bas.
