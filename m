From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add function to check that all
 MSR's are valid
Date: Fri, 22 Mar 2013 11:06:47 -0400
Message-ID: <20130322150647.GA1632@redhat.com>
References: <1363796244-6658-1-git-send-email-dirk.brandewie@gmail.com>
 <5149FFE1.7030706@gmail.com>
 <13387259.b2vHhipG0R@vostro.rjw.lan>
 <1589305.6YMuneKuPN@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1589305.6YMuneKuPN@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Fri, Mar 22, 2013 at 01:40:49AM +0100, Rafael J. Wysocki wrote:
 > On Thursday, March 21, 2013 01:08:03 AM Rafael J. Wysocki wrote:
 > > On Wednesday, March 20, 2013 11:28:49 AM Dirk Brandewie wrote:
 > > > On 03/20/2013 11:28 AM, Rafael J. Wysocki wrote:
 > > > > On Wednesday, March 20, 2013 09:17:24 AM dirk.brandewie@gmail.com wrote:
 > > > >> From: Dirk Brandewie <dirk.brandewie@gmail.com>
 > > > >>
 > > > >> Some VMs seem to try to implement some MSRs but not all the registers
 > > > >> the driver needs.  Check to make sure all the MSR that we need are
 > > > >> available. If any of the required MSRs are not available refuse to
 > > > >> load.
 > > > >>
 > > > >> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
 > > > >
 > > > > Is this needed for v3.9?  Any pointers to bug reports etc.?
 > > > >
 > > > 
 > > > Sorry I saw right after I sent the mail that the bug report was missing
 > > > 
 > > >      https://bugzilla.redhat.com/show_bug.cgi?id=922923
 > > >      Reported-by: Josh Stone <jistone@redhat.com>
 > > > 
 > > > Would you like me to spin the patch?
 > > 
 > > No, thanks, this information is sufficient.
 > 
 > Applied to linux-pm.git/bleeding-edge and will be moved to linux-next after
 > build testing.

'next' seems to be imply you're targetting this for 3.10 ?
In case it wasn't clear, this is needed for 3.9.

	Dave

