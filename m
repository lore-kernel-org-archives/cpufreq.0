From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: Re: ondemand vs suspend.
Date: Wed, 21 Jun 2006 11:54:13 -0700
Message-ID: <20060621115413.A16324@unix-os.sc.intel.com>
References: <EB12A50964762B4D8111D55B764A8454110B16@scsmsx413.amr.corp.intel.com>
	<44972ACB.2040609@goop.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44972ACB.2040609@goop.org>;
	from jeremy@goop.org on Mon, Jun 19, 2006 at 03:52:59PM -0700
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk, pjones@redhat.com

On Mon, Jun 19, 2006 at 03:52:59PM -0700, Jeremy Fitzhardinge wrote:
> Pallipadi, Venkatesh wrote:
> > Yes. I am able to reproduce this 2.6.17-rc6 and trying to narrow it
> > down.
> >
> > Also, there is a known issue with ondemand and resuming anyway as the
> > second CPU will not be able to resume with ondemand, but instead will go
> > back to 'default' governor on initialization. 
> > So, even with this bug fixed, we cannot suspend-resume with ondemand
> > governor. Workaround for now can be just to switch to default governor
> > before suspend and go back to ondemand after resume, using initscripts. 
> >   
> I've noticed another problem, which may be related.  Sometimes after 
> resume, cpufreq seems to lose the ability to control the CPU speeds: 
> they stay at the lowest performance level, and don't change regardless 
> of what governor I set.  I'm seeing this on a T2400 Core Duo.  I'm not 
> sure if this is a speedfreq-centrino problem or cpufreq itself.
> 
>     J

Does it only happen on CPU 1 or both the CPUs? What does /sys/.../cpufreq
look like once you get to this stuck at lowest freq state? Does 
scaling_available_frequencies still show all the freqs.

Thanks,
Venki
