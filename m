From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCHES] cpufreq_get(), cpufreq->get()
Date: Wed, 14 Apr 2004 11:52:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414105250.GE24970@redhat.com>
References: <20040411215912.GA8160@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040411215912.GA8160@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Sun, Apr 11, 2004 at 11:59:12PM +0200, Dominik Brodowski wrote:

 > The following patchset is based on the current cpufreq bitkeeper patch
 > and one important speedstep-centrino patch 
 > [see http://www.linux.org.uk/mailman/private/cpufreq/2004-April/003499.html ].
 > 
 > I suggest that this patchset is considered for the 2.6.7 timeframe; 
 > while the x86 parts seem to be quite straightforward, the arm 
 > architecture might be affected more heavily: it already relied on 
 > cpufreq_get(), and I can't verify my changes do even compile. Russell, 
 > I hope I didn't break anything this time...

Lets roll these in after 2.6.6 is out, and they can sit in -mm for a while.

		Dave
