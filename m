From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] replace for_each_cpu with for_each_cpu_mask
Date: Fri, 11 Jun 2004 13:27:14 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040611122714.GA5179@redhat.com>
References: <20040611100912.GG1095@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040611100912.GG1095@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Fri, Jun 11, 2004 at 12:09:12PM +0200, Bruno Ducrot wrote:

 > > That's indeed shorter -- don't know why whoever converted p4-clockmod
 > > to the new sibling mask did use for_each_cpu_mask...

I think I found out why.
 
 > Something like that should be ok, I guess.

for_each_cpu_mask doesn't exist on non-SMP in mainline.

		Dave
