From: Dominik Brodowski <linux@brodo.de>
Subject: Re: cpufreq and 2.4.
Date: Mon, 18 Aug 2003 20:00:12 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030818180012.GA1824@brodo.de>
References: <20030817153510.GA2361@brodo.de> <3F40AEC8.3060306@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F40AEC8.3060306@basmevissen.nl>
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
Cc: cpufreq@www.linux.org.uk

On Mon, Aug 18, 2003 at 12:47:36PM +0200, Bas Mevissen wrote:
> >B) Difficult-to-understand cpufreq user interfaces
> >The /proc/cpufreq and /proc/sys/cpu interfaces are difficult to understand
> >and already deprecated in 2.6. Do we really want them to be added to a
> >stable kernel release?
> >
> 
> Well, what then? There is no sysfs in 2.4, so we need something else to 
> control the beast :-)
> 
> How feasable is it to "port" the sysfs _interface_ to /proc? It would 
> simplicate matters for users, cpufreqd and documentation as they only 
> needs to change the "working directory" for 2.4.
> 
> (Because sysfs is something completely different than /proc, it would 
> mean writing new code. But as 2.4 will be in use for a couple of years, 
> I think it is worth the trouble.)

This seems to be a somewhat reasonable approach. However, it needs to be
made clear that this interface will only be available on 2.4. kernels. /proc
is bloated in 2.4., and so I don't mind, but for 2.6++ it should be aimed at
removing unneccessary stuff from /proc, so I'd strongly oppose
forward-porting this interface to 2.6. 

Anyways, anyone willing to write the "cpufreq 2.4. sysfs-emulation /proc
interface"?

	Dominik
