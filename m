From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Remove extra arg from dprintk in cpufreq/speedstep-smi.c
Date: Sun, 7 Aug 2005 15:57:25 -0400
Message-ID: <20050807195725.GA5844@redhat.com>
References: <20050807194939.GA22710@miku.homelinux.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050807194939.GA22710@miku.homelinux.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mikukkon@gmail.com
Cc: cpufreq@lists.linux.org.uk

On Sun, Aug 07, 2005 at 10:49:39PM +0300, Mika Kukkonen wrote:
 > Minor fallout from my upcoming __attribute__((format(printf,x,y)))
 > patches. The variable 'result' is untouched, so this patch just removes
 > it.
 > 
 > Signed-off-by: Mika Kukkonen <mikukkon@gmail.com>

Applied to cpufreq.git.

Thanks.

		Dave
