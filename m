From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] 2/2 fix driver removal code to clean up all governors
Date: Mon, 21 Nov 2005 10:36:20 -0500
Message-ID: <20051121153620.GB29968@redhat.com>
References: <84EA05E2CA77634C82730353CBE3A8430321891A@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8430321891A@SAUSEXMB1.amd.com>
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

On Thu, Nov 10, 2005 at 04:53:57PM -0600, Langsdorf, Mark wrote:
 > This patch fixes a bug that causes a segfault when the
 > powernow-k8 driver is removed while the ondemand 
 > governor is running.
 > 
 > Signed-off-by: Jacob Shin <jacob.shin@amd.com>
 > Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

Can you elaborate on this one a little ?

(Also: Please make your patches so that they apply with -p1
 I fixed up the other one by hand adding in the full pathname,
 but I'm far too lazy to do that for every patch :-)

		Dave
