From: Dave Jones <davej@redhat.com>
Subject: Re: [discuss] 2.6.19-rc6: known regressions (v4)
Date: Tue, 21 Nov 2006 16:31:39 -0500
Message-ID: <20061121213139.GC9651@redhat.com>
References: <Pine.LNX.4.64.0611152008450.3349@woody.osdl.org>
	<20061121212424.GQ5200@stusta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061121212424.GQ5200@stusta.de>
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
To: Adrian Bunk <bunk@stusta.de>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

On Tue, Nov 21, 2006 at 10:24:24PM +0100, Adrian Bunk wrote:

 > Subject    : CPU_FREQ_GOV_ONDEMAND=y compile error
 > References : http://lkml.org/lkml/2006/11/17/198
 > Submitter  : alex1000@comcast.net
 > Caused-By  : Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
 >              commit 05ca0350e8caa91a5ec9961c585c98005b6934ea
 > Handled-By : Mattia Dongili <malattia@linux.it>
 > Patch      : http://lkml.org/lkml/2006/11/17/236
 > Status     : patch available

not a regression, easily worked around, queued for .20

		Dave

-- 
http://www.codemonkey.org.uk
