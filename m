From: Dominik Brodowski <linux@brodo.de>
Subject: [RFC] yet more file moves
Date: Wed, 27 Aug 2003 08:02:29 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030827060229.GA4315@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I hereby suggest that 
a) for 2.4. and 2.6. drivers/cpufreq/userspace.c is moved to 
   drivers/cpufreq/cpufreq-userspace.c,
b) for 2.4, the x86 cpufreq drivers are moved to arch/i386/kernel/cpufreq/

Rationale:
to a)	"userspace" as module name is too generic for the use of a small
subsystem like cpufreq.

to b)	arch/i386/kernel/ is already very crowded. Let's not fill it
further, but move stuff to a seperate subdirectury, just like in 2.6.

Comments?

	Dominik
