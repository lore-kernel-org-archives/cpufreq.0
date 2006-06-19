From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: ondemand vs suspend.
Date: Mon, 19 Jun 2006 15:52:59 -0700
Message-ID: <44972ACB.2040609@goop.org>
References: <EB12A50964762B4D8111D55B764A8454110B16@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454110B16@scsmsx413.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, pjones@redhat.com, cpufreq@lists.linux.org.uk

Pallipadi, Venkatesh wrote:
> Yes. I am able to reproduce this 2.6.17-rc6 and trying to narrow it
> down.
>
> Also, there is a known issue with ondemand and resuming anyway as the
> second CPU will not be able to resume with ondemand, but instead will go
> back to 'default' governor on initialization. 
> So, even with this bug fixed, we cannot suspend-resume with ondemand
> governor. Workaround for now can be just to switch to default governor
> before suspend and go back to ondemand after resume, using initscripts. 
>   
I've noticed another problem, which may be related.  Sometimes after 
resume, cpufreq seems to lose the ability to control the CPU speeds: 
they stay at the lowest performance level, and don't change regardless 
of what governor I set.  I'm seeing this on a T2400 Core Duo.  I'm not 
sure if this is a speedfreq-centrino problem or cpufreq itself.

    J
