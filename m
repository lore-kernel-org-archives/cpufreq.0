From: Dave Jones <davej@redhat.com>
Subject: Re: [2.6 patch] cpufreq.c: reorder for inlining
Date: Sun, 11 Jul 2004 11:57:00 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040711105700.GB9714@redhat.com>
References: <20040711104012.GB4701@fs.tum.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040711104012.GB4701@fs.tum.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@fs.tum.de>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Sun, Jul 11, 2004 at 12:40:13PM +0200, Adrian Bunk wrote:
 
 > The patc below reorders cpufreq.c to move adjust_jiffies before it's 
 > callers.
 > 
 > diffstat output:
 >  drivers/cpufreq/cpufreq.c |  160 +++++++++++++++++++-------------------
 >  1 files changed, 80 insertions(+), 80 deletions(-)
 > 
 > 
 > Signed-off-by: Adrian Bunk <bunk@fs.tum.de>

Applied, Thanks Adrian.

		Dave
