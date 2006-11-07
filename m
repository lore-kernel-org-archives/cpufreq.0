From: Gary Hade <garyhade@us.ibm.com>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Tue, 7 Nov 2006 10:57:13 -0800
Message-ID: <20061107185713.GC11620@us.ibm.com>
References: <20061106233923.GA15063@us.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061106233923.GA15063@us.ibm.com>
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
To: Gary Hade <garyhade@us.ibm.com>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com

On Mon, Nov 06, 2006 at 03:39:23PM -0800, Gary Hade wrote:
> 
> On some systems such as the IBM x3650 there are bits set in the 
> upper half of the control values provided by the _PSS object.  
> These bits are only relevant for cpufreq drivers that use IO ports 
> which are not currently supported by the speedstep-centrino driver.  
> The current MSR oriented code assumes that upper bits are not set 
> and thus fails to work correctly when they are.  e.g. the control 
> and status value equality check fails even though the ACPI spec 
> allows the inequality.
> 
> Signed-off-by: Gary Hade <garyh@us.ibm.com>

Sorry, incorrect email address.  This should be
  Signed-off-by: Gary Hade <garyhade@us.ibm.com>

Gary

-- 
Gary Hade
IBM Linux Technology Center
503-578-4503  IBM T/L: 775-4503
garyhade@us.ibm.com
http://www.ibm.com/linux/ltc
