From: Dave Jones <davej@redhat.com>
Subject: Re: speedstep-smi detection broken.
Date: Tue, 17 Oct 2006 14:07:45 -0400
Message-ID: <20061017180745.GD18353@redhat.com>
References: <20061017055529.GJ32681@redhat.com>
	<a11ccc30610170700h61c7a9bbgf9f3e74b62fd6c28@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <a11ccc30610170700h61c7a9bbgf9f3e74b62fd6c28@mail.gmail.com>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: cpufreq@lists.linux.org.uk

On Tue, Oct 17, 2006 at 11:00:42PM +0900, Hiroshi Miura wrote:
 > I prefer removing all of P4M case  block  if you remove the printk too.
 > This means simply not to support P4M with this driver and
 > return -ENODEV.
 > If user turn on debug flag, they may see
 > 	dprintk ("No supported Intel CPU detected.\n");
 > as same as other CPUs.

Yes, even better. I'll apply this.
Want me to fake a Signed-off-by: from you, as you forgot to add one? :)

	Dave 

-- 
http://www.codemonkey.org.uk
