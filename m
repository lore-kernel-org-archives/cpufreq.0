From: Myron Stowe <myron.stowe@hp.com>
Subject: Re: cpufreq_set_policy removed
Date: Wed, 20 Jun 2007 15:20:31 -0600
Message-ID: <1182374431.8149.30.camel@localhost>
References: <20070606214243.GX15955@bakeyournoodle.com>
	<1181170878.31677.272.camel@localhost.localdomain>
	<20070606231342.GA16771@redhat.com>
	<1181929526.3436.8.camel@kp-core.localdomain>
	<1182255270.28514.620.camel@queen.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1182255270.28514.620.camel@queen.suse.de>
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
To: trenn@suse.de, Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@lists.linux.org.uk>


Thomas, Dave:

Do either of you have a problem with the existence of
cpufreq_set_policy() or was it only removed because there were no
remaining callers in the tree and it had bugs?

The reason why I ask is that I have been working on a module that
changes cpufreq governors and I don't see any other way for a module to
be able to change governors without this interface.

If there is another way please let me know.  Otherwise I would like to
fix the cpufreq_set_policy() related bugs and make it available for
modules to use.

Myron

-- 
Myron Stowe                             HP Open Source & Linux Org
