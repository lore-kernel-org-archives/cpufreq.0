From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][1/2] Clarify cpu_family statements
Date: Tue, 20 Jun 2006 01:47:49 -0400
Message-ID: <20060620054749.GC6091@redhat.com>
References: <84EA05E2CA77634C82730353CBE3A8430564A36C@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8430564A36C@SAUSEXMB1.amd.com>
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
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Jun 08, 2006 at 10:30:17AM -0500, Langsdorf, Mark wrote:
 > This patch clarfies the meaning of the cpu_family if
 > statements in the hw pstate driver patch for powernow-k8
 > 
 > -Mark Langsdorf
 > AMD, Inc.
 > 
 > (inline and attached because my mailer is very braindead)

Very. MIME confuses the bejesus out of git-apply unless you kill
off every trace of it.  Still, I managed to fight your mail headers
and get them to apply.   Both diffs will be in 2.6.18

Thanks,

		Dave

-- 
http://www.codemonkey.org.uk
