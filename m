From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq and 2.4.
Date: Tue, 19 Aug 2003 13:42:54 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030819114254.GK18032@poupinou.org>
References: <20030817153510.GA2361@brodo.de> <3F40AEC8.3060306@basmevissen.nl> <20030818180012.GA1824@brodo.de> <3F41E3AD.5060806@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F41E3AD.5060806@basmevissen.nl>
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

On Tue, Aug 19, 2003 at 10:45:33AM +0200, Bas Mevissen wrote:
> Dominik Brodowski wrote:
> >
> >> (make a cpufreq /proc interface for 2.4 that looks like sysfs
> >> interface in 2.6)
> 
> >This seems to be a somewhat reasonable approach. However, it needs to be
> >made clear that this interface will only be available on 2.4. kernels. 
> >/proc
> >is bloated in 2.4., and so I don't mind, but for 2.6++ it should be aimed 
> >at
> >removing unneccessary stuff from /proc, so I'd strongly oppose
> >forward-porting this interface to 2.6. 
> >
> 
> OK. I second that we should not introduce a new /proc interface in 2.6. 
> But then the question is what to do with the /proc interface in 2.6?
> 
> I would say, remove /proc in 2.6 ASAP. We need to align this with the 
> update of the userspace governors (if they don't support sysfs already).
> 

I can't be sure at 100%, and rmk will know more than me, but
I guess you will be blamed by ARM people if you remove
/proc/sys/cpu/... stuff.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
