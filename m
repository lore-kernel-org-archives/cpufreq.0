From: Dave Jones <davej@redhat.com>
Subject: Re: [RFC] cpufreq_driver->resume
Date: Tue, 2 Sep 2003 12:08:26 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902110826.GA30038@redhat.com>
References: <20030902083227.GB3958@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030902083227.GB3958@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk


On Tue, Sep 02, 2003 at 10:32:27AM +0200, Dominik Brodowski wrote:

 > +cpufreq_driver.resume -		A pointer to a per-CPU resume function
 > +				which is called with interrupts disabled
 > +				and _before_ the pre-suspend frequency
 > +				and/or policy is restored by a call to
 > +				->target or ->setpolicy.
 > +

What advantage is there to doing things this way over just
setting the speed to the last known value before we suspended ?
(though some drivers may need fixing, as they shortcut the
 'trying to set to current speed' thing with a return so we
 don't actually poke anything.)

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
