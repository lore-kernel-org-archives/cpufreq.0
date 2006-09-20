From: Dave Jones <davej@redhat.com>
Subject: Re: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 01:02:28 -0400
Message-ID: <20060920050228.GA29548@redhat.com>
References: <1158728112.19359.18.camel@pelerin.serpentine.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1158728112.19359.18.camel@pelerin.serpentine.com>
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
To: Bryan O'Sullivan <bos@serpentine.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Sep 19, 2006 at 09:55:12PM -0700, Bryan O'Sullivan wrote:
 > I'm running the 2.6.17-1.2174_FC5 x86_64 kernel from FC5 updates on a
 > Dell PowerEdge 830 server with a Pentium D 930 inside.  I can modprobe
 > acpi_cpufreq, but it doesn't do anything - there are no kernel log
 > messages, no new sysfs files to look at, nothing in /proc/acpi.
 > 
 > cpufreq-info tells me that I have no cpufreq support, but I had kind of
 > figured that out already :-(
 > 
 > Is there something more I should be doing?
 
Does the CPU actually support frequency scaling?
What does /proc/cpuinfo say ?

	Dave
