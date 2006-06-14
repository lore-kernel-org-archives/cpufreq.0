From: Peter Jones <pjones@redhat.com>
Subject: RE: ondemand vs suspend.
Date: Tue, 13 Jun 2006 23:08:42 -0400
Message-ID: <1150254522.16845.20.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

On Tue, 2006-06-13 at 19:50 -0700, Pallipadi, Venkatesh wrote:
> Yes. I am able to reproduce this 2.6.17-rc6 and trying to narrow it
> down.
> 
> Also, there is a known issue with ondemand and resuming anyway as the
> second CPU will not be able to resume with ondemand, but instead will go
> back to 'default' governor on initialization. 
> So, even with this bug fixed, we cannot suspend-resume with ondemand
> governor. Workaround for now can be just to switch to default governor
> before suspend and go back to ondemand after resume, using initscripts. 

Yeah, that's what I implemented for our pm utils earlier today.

-- 
  Peter
