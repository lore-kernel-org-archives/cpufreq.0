From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Thu, 10 Jun 2004 12:20:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610112015.GF7964@redhat.com>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<40C7AF6C.1080408@cern.ch>
	<20040610083038.GA18693@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040610083038.GA18693@dominikbrodowski.de>
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
To: holbling@cpt.univ-mrs.fr, davej@codemonkey.org.uk, Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Thu, Jun 10, 2004 at 10:30:38AM +0200, Dominik Brodowski wrote:

 > I mean that only one instance of a governor can be loaded on one physical
 > CPU. The same problem exists in current p4-clockmod and was a mis-design of
 > the cpufreq core [by me...], so it needs to be fixed quite soon.
 > 
 > Both patches look good to me -- Dave, could you apply them, please?

I fell behind again on the cpufreq backlog. I'll try to get
around to clearing it today/tomorrow.

		Dave
