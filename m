From: Dave Jones <davej@redhat.com>
Subject: Re: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 01:13:27 -0400
Message-ID: <20060920051327.GB29548@redhat.com>
References: <1158728112.19359.18.camel@pelerin.serpentine.com>
	<20060920050228.GA29548@redhat.com>
	<1158729075.19359.25.camel@pelerin.serpentine.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1158729075.19359.25.camel@pelerin.serpentine.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan O'Sullivan <bos@serpentine.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Sep 19, 2006 at 10:11:15PM -0700, Bryan O'Sullivan wrote:
 > On Wed, 2006-09-20 at 01:02 -0400, Dave Jones wrote:
 > 
 > > Does the CPU actually support frequency scaling?
 > 
 > It would appear not (see below).  How strange.
 > 
 > > What does /proc/cpuinfo say ?
 > 
 > Very little:
 > 
 >     power management:
 > 
 > I suppose there's not much I can do then.

The important line is 'flags'. Does that have eist ?

	Dave
