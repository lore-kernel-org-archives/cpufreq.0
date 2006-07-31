From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/8] acpi-cpufreq: fix multicore bug
Date: Mon, 31 Jul 2006 17:49:50 -0400
Message-ID: <20060731214950.GD31513@redhat.com>
References: <44CE4E0B.608@linux.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44CE4E0B.608@linux.intel.com>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jul 31, 2006 at 10:38:03PM +0400, Alexey Starikovskiy wrote:
 > acpi-cpufreq.c |   98 
 > +++++++++------------------------------------------------
 > 1 file changed, 17 insertions(+), 81 deletions(-)
 > 
 > Fix a problem on a multicore processors. 
 > 
 > Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
 > Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
 > Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Can I get a little more verbose description for the changelog please ?
I think I understand whats going on here, but I'd like to understand
it more than "fix a bug" when I'm browsing the history 6 months from now.

Also, is there any way you can make thunderbird not send mails
with format=flowed in your Content-type: ?  mutt respects this attribute
and handily word-wraps your diffs. (Which doesn't matter for applying
them, but it does make it a pain when reviewing).

Thanks,

		Dave

-- 
http://www.codemonkey.org.uk
