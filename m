From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: cpuspeed daemon
Date: 21 Jun 2003 16:29:09 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056238149.30963.394.camel@ixodes.goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq list <cpufreq@www.linux.org.uk>

I've been playing around with a little daemon to manage CPU performance
policies.  The intention was not to do some all singing thing which
looks at power source, battery life, running processes, etc, etc, but
something simple to enforce a single policy; if you want to switch
policies, you can do that on the fly.

I've only tried it on my Centrino machine, so it has a fair number of
performance points to play with.  I'm interested to know if it does
anything useful for other chips' power management.

http://www.goop.org/~jeremy/cpuspeed

	J
