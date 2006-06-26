From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: ondemand vs suspend.
Date: Mon, 26 Jun 2006 12:23:21 -0700
Message-ID: <44A03429.40304@goop.org>
References: <EB12A50964762B4D8111D55B764A84541D4DBA@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84541D4DBA@scsmsx413.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, pjones@redhat.com, cpufreq@lists.linux.org.uk

Pallipadi, Venkatesh wrote:
> I am not able to reprocude this on my Core Duo system.  At this point I
> will need some more information on what exactly happens at this point of
> failure to start looking at the code.. Like questions above. Does
> scaling_available_frequencies still show all freqs. What is *max *min
> values in /sys/.../cpufreq/ ..
>   
Yes, all the expected frequencies are there.  I sent you mail with all 
the contents of /sys/.../cpu?/cpufreq/... the other day; should I resend it?

Thanks,
    J
